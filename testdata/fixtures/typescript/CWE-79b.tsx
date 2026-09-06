// CWE-79: the DOM sinks that parse what they are given as HTML.
// dangerouslySetInnerHTML is React's own and belongs to typescript-xss,
// so this rule must not fire on it.
function vuln(user: string) {
    // ruleid: typescript-dom-xss
    document.write(user);
    // ruleid: typescript-dom-xss
    element.innerHTML = user;
    const html = user;
    // ok: typescript-dom-xss
    return <div dangerouslySetInnerHTML={{__html: html}} />;
}
function safe() {
    // ok: typescript-dom-xss
    document.write("hello");
    // ok: typescript-dom-xss
    element.innerHTML = "<p>fixed</p>";
    // ok: typescript-dom-xss
    return <div dangerouslySetInnerHTML={{__html: "<p>hi</p>"}} />;
}
let element: HTMLElement = null as any;
