// AI usage detection: Apple CoreML
import Foundation
// ruleid: detect-apple-core-ml
let config = MLModelConfiguration()
// ruleid: detect-apple-core-ml
let model = VNCoreMLModel(for: config)
// ruleid: detect-apple-core-ml
let other = MLModelConfiguration()
// ok: detect-apple-core-ml
import Dispatch
// ok: detect-apple-core-ml
let text = "plain string"
// ok: detect-apple-core-ml
let x = 1
