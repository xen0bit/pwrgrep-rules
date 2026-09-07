// AI usage detection: OpenAI via go-openai
package main
// ruleid: detect-openai
import "github.com/sashabaranov/go-openai"
import "fmt"
// ruleid: detect-openai
func newClient() { gogpt.NewClient("key") }
// ruleid: detect-openai
func otherClient() { gogpt.NewClient("other") }
// ok: detect-openai
import "strings"
// ok: detect-openai
func safe() { fmt.Println("hi") }
// ok: detect-openai
func safe2() { return }
