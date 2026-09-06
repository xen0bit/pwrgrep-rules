# CWE-77b: system with shell metachar [|;&$`]
def vuln1
  user = params[:cmd]
  # ruleid: ruby-77-shell
  system(user)
end

def vuln2
  q = params["input"]
  # ruleid: ruby-77-shell
  exec(q)
end

def vuln3
  ck = cookies[:cmd]
  # ruleid: ruby-77-shell
  Kernel.system(ck)
end

def safeAllowlist
  allowlist = params[:cmd]
  if allowlist != "ls"
    raise "bad"
  end
  # ok: ruby-77-shell
  system(allowlist)
end

def safeFixed
  # ok: ruby-77-shell
  system("ls -l /tmp")
end
