# CWE-798 Hardcoded Credentials in Ruby
# Embedding passwords, secrets or API keys directly in source code exposes
# them to anyone with repository access and makes rotation impossible.

# ruleid: ruby-hardcoded-credential
password = "supersecret123"

# ruleid: ruby-hardcoded-credential
api_key = "AKIAIOSFODNN7EXAMPLE"

# ruleid: ruby-hardcoded-credential
secret = "my_hardcoded_secret_!@#"

# ruleid: ruby-hardcoded-credential
aws_secret = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

# ok: ruby-hardcoded-credential
password = ENV["PASSWORD"]

# ok: ruby-hardcoded-credential
api_key = ENV.fetch("API_KEY")

# ok: ruby-hardcoded-credential
secret = get_secret_from_vault()
