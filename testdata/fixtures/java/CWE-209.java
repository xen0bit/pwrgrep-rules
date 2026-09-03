package fixture;

// CWE-209: the stack trace goes back to whoever caused it.
//
// An exception message in Java is written for the operator, not for the
// caller. It carries absolute paths, class and method names, the SQL that
// failed with the table and column names in it, and often the value that
// failed to parse. Handing that to the client turns every malformed request
// into a free map of the application - which is exactly how an attacker
// wants to start, and it is free because the program volunteered it.
//
// The rule reports a write to the *response* and nothing else. `System.out`
// and a logger are where this belongs and are common inside a catch, so a
// rule that could not tell one from the other would report every careful
// program in the corpus. The response is named explicitly - `getWriter`,
// `getOutputStream`, `sendError` - which is what makes the distinction
// syntactic.
//
// `sendError(code)` without a message is the fix, and it is left alone.

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

class Cwe209 {

    void handle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Integer.parseInt(request.getParameter("n"));
        } catch (NumberFormatException e) {
            // ruleid: java-exception-detail-reaches-the-client
            response.getWriter().println("failed: " + e.getMessage());
        }
    }

    void handleWithSendError(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Integer.parseInt(request.getParameter("n"));
        } catch (NumberFormatException e) {
            // ruleid: java-exception-detail-reaches-the-client
            response.sendError(400, e.toString());
        }
    }

    // The writer taken into a local first, which is the shape a Spring
    // @ExceptionHandler usually has. The declaration and the write have to be
    // siblings for one pattern to see both, which is the usual limit of a
    // two-statement reading: a writer taken before a try and written inside
    // the catch is the same bug and is not reported.
    void onError(Exception e, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.println("could not complete the request");
        // ruleid: java-exception-detail-reaches-the-client
        writer.println(e.getMessage());
    }

    void dumpsTheTrace(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Integer.parseInt(request.getParameter("n"));
        } catch (NumberFormatException e) {
            // ruleid: java-exception-detail-reaches-the-client
            e.printStackTrace(response.getWriter());
        }
    }

    // The operator's console is where this belongs.
    void logsIt(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Integer.parseInt(request.getParameter("n"));
        } catch (NumberFormatException e) {
            // ok: java-exception-detail-reaches-the-client
            System.out.println("failed: " + e.getMessage());
            response.sendError(400);
        }
    }

    // A message the program wrote is a message the program meant to send.
    void saysNoMore(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Integer.parseInt(request.getParameter("n"));
        } catch (NumberFormatException e) {
            // ok: java-exception-detail-reaches-the-client
            response.getWriter().println("that is not a number");
        }
    }
}
