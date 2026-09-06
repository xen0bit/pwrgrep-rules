# CWE-532: Insertion of Sensitive Information into Log File
#
# Logging a password, secret or token exposes it in log files which are often
# world-readable or shipped to third parties.

def leak(password, secret, api_key)
  # ruleid: ruby-sensitive-log
  logger.info(password)
  # ruleid: ruby-sensitive-log
  puts secret
  # ruleid: ruby-sensitive-log
  Rails.logger.info(api_key)
end

def safe
  # ok: ruby-sensitive-log
  logger.info("user logged in")
  # ok: ruby-sensitive-log
  puts "request processed"
  # ok: ruby-sensitive-log
  Rails.logger.info("done")
end
