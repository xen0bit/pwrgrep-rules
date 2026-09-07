// Building an EL expression from a dynamic value allows expression injection.
// The rule is textual: parameters stay comma-compact and a statement precedes
// the sink call. Findings land on the method line; literal expressions are fine.
import javax.el.ExpressionFactory;

public class ElInjection {
    // ruleid: el-injection
    void flag(String userExpr,ExpressionFactory ef,javax.el.ELContext ctx) {
        System.out.println("start");
        ef.createValueExpression(ctx,userExpr,String.class);
    }

    // Merged into the previous match; left unmarked on purpose.
    void flagMerged(String userExpr,ExpressionFactory ef,javax.el.ELContext ctx) {
        System.out.println("start");
        ef.createValueExpression(ctx,userExpr,String.class);
    }

    // ruleid: el-injection
    void flagAgain(String data,ExpressionFactory factory,javax.el.ELContext ctx) {
        System.out.println("start");
        factory.createValueExpression(ctx,data,String.class);
    }

    // ok: el-injection
    void safeLiteral(String userExpr, ExpressionFactory ef, javax.el.ELContext ctx) {
        System.out.println("start");
        ef.createValueExpression(ctx, "static", String.class);
    }

    // ok: el-injection
    void safeMethodLiteral(String userExpr, ExpressionFactory ef, javax.el.ELContext ctx) {
        System.out.println("start");
        ef.createMethodExpression(ctx, "static", String.class);
    }

    // ok: el-injection
    void safeLocal(String userExpr, ExpressionFactory ef, javax.el.ELContext ctx) {
        System.out.println("start");
        String expr = "static";
        ef.createValueExpression(ctx, expr, String.class);
    }
}
