def shell_index
  name = params[:cmd]
  # ruleid: avoid-tainted-shell-call
  Kernel.system(name)

  other = params['other']
  # ruleid: avoid-tainted-shell-call
  Kernel.exec(other)

  third = cookies[:cmd]
  # ruleid: avoid-tainted-shell-call
  Kernel.spawn(third)
end

def shell_safe
  # ok: avoid-tainted-shell-call
  Kernel.system('ls')

  # ok: avoid-tainted-shell-call
  Kernel.exec('echo hi')

  # ok: avoid-tainted-shell-call
  'system in a string is not a call'
end
