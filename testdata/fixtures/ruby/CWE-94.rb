# CWE-94 Code Injection (eval) in Ruby
# Ruby's eval family executes arbitrary Ruby code. Passing user-controlled
# strings to eval, instance_eval or class_eval leads to remote code execution.

def search
  user_code = params[:code]
  data = params.get("expr")
  ck = cookies[:x]
  q = request.query_string

  # ruleid: ruby-code-injection
  eval(user_code)

  # ruleid: ruby-code-injection
  Kernel.eval(data)

  # ruleid: ruby-code-injection
  user_code.instance_eval(ck)

  # ruleid: ruby-code-injection
  user_code.class_eval(q)

  # ok: ruby-code-injection
  eval("1 + 2")

  # ok: ruby-code-injection
  Kernel.eval("fixed string")

  # ok: ruby-code-injection
  "hello".instance_eval("upcase")
end
