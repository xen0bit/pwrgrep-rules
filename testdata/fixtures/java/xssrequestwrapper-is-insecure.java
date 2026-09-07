import javax.servlet.http.HttpServletRequestWrapper;

public class WrappersOne {
    // ruleid: xssrequestwrapper-is-insecure
    public class XSSRequestWrapper extends HttpServletRequestWrapper {
        public XSSRequestWrapper(javax.servlet.http.HttpServletRequest request) {
            super(request);
        }
    }
}

class WrappersTwo {
    // ruleid: xssrequestwrapper-is-insecure
    public class XSSRequestWrapper extends HttpServletRequestWrapper {
        public XSSRequestWrapper(javax.servlet.http.HttpServletRequest request) {
            super(request);
        }
    }
}

class WrappersThree {
    // ruleid: xssrequestwrapper-is-insecure
    public class XSSRequestWrapper extends HttpServletRequestWrapper {
        public XSSRequestWrapper(javax.servlet.http.HttpServletRequest request) {
            super(request);
        }
    }
}

// ok: xssrequestwrapper-is-insecure
class PlainWrapper {
    public String wrap(String s) {
        return s;
    }
}

// ok: xssrequestwrapper-is-insecure
class Empty {
}

// ok: xssrequestwrapper-is-insecure
class Helper {
    public String help() {
        return "no wrapper here";
    }
}
