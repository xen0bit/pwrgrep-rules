// correctness-regioninfo-interop: a RegionInfo written to a pipe carries a
// two-letter code the other end may read as a different culture. Pass the
// full culture name instead. The rule reads a single-statement using body
// (see the rule header).
using System.Globalization;
using System.IO.Pipes;

namespace Fixture {
    public class Interop {
        public void Vuln() {
            RegionInfo ri = new RegionInfo("US");
            using (NamedPipeServerStream p = new NamedPipeServerStream("pipe")) {
                // ruleid: correctness-regioninfo-interop
                new System.IO.StreamWriter(p).Write(ri);
            }
        }

        public void Vuln2() {
            RegionInfo ri = new RegionInfo("DE");
            using (AnonymousPipeClientStream p = new AnonymousPipeClientStream(PipeDirection.In, "h")) {
                // ruleid: correctness-regioninfo-interop
                new System.IO.StreamWriter(p).WriteLine(ri);
            }
        }

        // ok: correctness-regioninfo-interop
        public void Safe() {
            RegionInfo ri = new RegionInfo("en-US");
            using (NamedPipeServerStream p = new NamedPipeServerStream("pipe")) {
                new System.IO.StreamWriter(p).Write(ri);
            }
        }

        // ok: correctness-regioninfo-interop
        public void Plain() {
            var w = new System.IO.StreamWriter(System.Console.OpenStandardOutput());
            w.Write("hello");
        }
    }
}
