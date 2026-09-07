import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;

public class SpelVuln {
    // ruleid: spel-injection
    public Object vuln(String expr) {
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression(expr).getValue();
    }
}

class SpelVulnAgain {
    // ruleid: spel-injection
    public Object vulnAgain(String expr) {
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression(expr).getValue();
    }
}

class SpelVulnThird {
    // ruleid: spel-injection
    public Object vulnThird(String input) {
        SpelExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression(input).getValue();
    }
}

class SpelSafe {
    // ok: spel-injection
    public Object safe() {
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression("1+1").getValue();
    }

    // ok: spel-injection
    public Object safeConst() {
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression("3+3").getValue();
    }

    // ok: spel-injection
    public Object plain() {
        return "parseExpression in a comment is not a call";
    }
}
