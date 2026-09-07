def call_index(num)
  # ruleid: dangerous-syscall
  syscall(num, 2)

  # ruleid: dangerous-syscall
  syscall(1, 2)

  # ruleid: dangerous-syscall
  Kernel.syscall(3, 4)
end

def call_safe
  # ok: dangerous-syscall
  system('ls')

  # ok: dangerous-syscall
  'syscall in a string is not a call'

  # ok: dangerous-syscall
  :syscall
end
