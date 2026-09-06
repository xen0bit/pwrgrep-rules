// memory-marshal-create-span: the length argument is trusted unchecked, so
// a wrong length reads or writes out of bounds. Check it against the buffer.
using System;
using System.Runtime.InteropServices;

namespace Fixture {
    public class Spans {
        public unsafe void Vuln(byte* ptr, int len) {
            // ruleid: memory-marshal-create-span
            var s = MemoryMarshal.CreateSpan(ref *ptr, len);
            s.Clear();
        }

        public unsafe void Vuln2(byte* ptr, int len) {
        // ruleid: memory-marshal-create-span
            var s = MemoryMarshal.CreateReadOnlySpan(ref *ptr, len);
            Console.WriteLine(s.Length);
        }

        // ok: memory-marshal-create-span
        public void Safe(Span<byte> buf) {
            var s = buf.Slice(0, 4);
            s.Clear();
        }

        // ok: memory-marshal-create-span
        public void Plain(byte[] arr) {
            Array.Clear(arr, 0, arr.Length);
        }
    }
}
