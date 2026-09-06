// data-contract-resolver: a custom DataContractResolver decides which types
// the payload may name, so a permissive one reopens deserialization attacks.
// Only resolve types you expect.
using System;
using System.Runtime.Serialization;

namespace Fixture {
    // ruleid: data-contract-resolver
    public class LenientResolver : DataContractResolver {
        public override Type ResolveName(string n, string ns, Type t, DataContractResolver r) {
            return Type.GetType(n);
        }
        public override bool TryResolveType(Type t, Type dt, DataContractResolver r, out System.Xml.XmlDictionaryString n, out System.Xml.XmlDictionaryString ns) {
            n = null;
            ns = null;
            return false;
        }
    }

    // ruleid: data-contract-resolver
    public class AllowlistFallback : DataContractResolver {
        public override Type ResolveName(string n, string ns, Type t, DataContractResolver r) {
            return t;
        }
        public override bool TryResolveType(Type t, Type dt, DataContractResolver r, out System.Xml.XmlDictionaryString n, out System.Xml.XmlDictionaryString ns) {
            n = null;
            ns = null;
            return false;
        }
    }

    // ok: data-contract-resolver
    public class PlainHelper {
        public Type Find(string n) {
            return Type.GetType(n);
        }
    }
}
