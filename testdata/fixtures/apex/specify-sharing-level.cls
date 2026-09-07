// Every Apex class should declare an explicit sharing mode. Without one
// the class runs in system context regardless of the caller's sharing.
// ruleid: specify-sharing-level
public class NoSharing {
}
// ok: specify-sharing-level
public with sharing class HasSharing {
}
// ruleid: specify-sharing-level
private class AlsoNoSharing {
}
// ok: specify-sharing-level
public without sharing class ExplicitNoSharing {
}
// ruleid: specify-sharing-level
global class GlobalNoSharing {
}
// ok: specify-sharing-level
public class MyEx extends Exception {
}
