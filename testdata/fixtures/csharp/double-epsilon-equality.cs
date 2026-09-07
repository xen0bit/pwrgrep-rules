// correctness-double-epsilon-equality: Double.Epsilon is the smallest
// denormal, not a comparison tolerance - any nonzero difference exceeds it.
// Compare against a real epsilon like 1e-9 instead.
namespace Fixture {
    public class Calc {
        public bool Vuln(double a, double b) {
            // ruleid: correctness-double-epsilon-equality
            return (a - b) <= double.Epsilon;
        }

        public bool Vuln2(double a, double b) {
        // ruleid: correctness-double-epsilon-equality
            return double.Epsilon <= (a - b);
        }

        // ok: correctness-double-epsilon-equality
        public bool Safe(double a, double b) {
            return (a - b) <= 1e-9;
        }

        // ok: correctness-double-epsilon-equality
        public bool Plain(double a, double b) {
            return a < b;
        }
    }
}
