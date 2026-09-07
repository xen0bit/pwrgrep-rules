// Building with debug flags leaks internals. Remove -Ydebug for
// production builds.
// ruleid: scalac-debug
scalacOptions += "-Ydebug"
// ruleid: scalac-debug
scalacOptions  +=  "-Ydebug"
// ruleid: scalac-debug
scalacOptions += "-Ydebug"
// ok: scalac-debug
scalacOptions += "-unchecked"
// ok: scalac-debug
scalacOptions += "-deprecation"
// ok: scalac-debug
scalacOptions ++= Seq("-encoding", "utf8")
