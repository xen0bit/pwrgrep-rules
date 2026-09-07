import ognl.OgnlUtil;

public class OgnlFixture {
    public Object dynamic(OgnlUtil util, String input) throws Exception {
        // ruleid: ognl-injection
        return util.getValue(input, null);
    }

    public Object dynamicFind(OgnlUtil util, String input) throws Exception {
        // ruleid: ognl-injection
        return util.findValue(input, null);
    }

    public Object literal(OgnlUtil util) throws Exception {
        // ok: ognl-injection
        return util.getValue("name", null);
    }

    public Object literalFind(OgnlUtil util) throws Exception {
        // ok: ognl-injection
        return util.findValue("constant", null);
    }
}
