// AI usage detection: Gemini via generative-ai-go
package main
// ruleid: detect-gemini
import "github.com/google/generative-ai-go"
import "fmt"
// ruleid: detect-gemini
func newGemini() { genai.NewClient(nil) }
// ruleid: detect-gemini
func otherGemini() { genai.NewClient("key") }
// ok: detect-gemini
import "strings"
// ok: detect-gemini
func safe() { fmt.Println("hi") }
// ok: detect-gemini
func safe2() { return }
