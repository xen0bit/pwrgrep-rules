// AI tooling detection: promptfoo
// ruleid: detect-promptfoo
import "promptfoo";
// ruleid: detect-promptfoo
const res = promptfoo.evaluate({ prompts: [], providers: [] });
// ruleid: detect-promptfoo
const res2 = promptfoo.evaluate({ tests: [] });
// ok: detect-promptfoo
import fs from "fs";
// ok: detect-promptfoo
const text = "plain string";
// ok: detect-promptfoo
console.log("hello");
