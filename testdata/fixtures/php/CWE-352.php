<?php
// CWE-352: CSRF — PHP forms without a hidden CSRF token are vulnerable.
// An attacker can forge a POST from another origin using the victim's
// session cookie. Include a token like <input name="csrf_token" value="...">.

// ruleid: php-csrf
echo '<form method="POST" action="/transfer"><input name="amount"><input type="submit"></form>';

// ruleid: php-csrf
echo "<form method='POST' action='/update'><input name='email'><button>Submit</button></form>";

// ruleid: php-csrf
echo '<form method="post" action="/delete"><input type="hidden" name="id" value="1"><button>Delete</button></form>';

// ok: php-csrf
echo '<form method="POST" action="/transfer"><input type="hidden" name="csrf_token" value="<?php echo $token; ?>"><input name="amount"></form>';

// ok: php-csrf
echo '<form method="POST" action="/update"><input name="email"><input type="hidden" name="_token" value="abc"><button>Go</button></form>';

// ok: php-csrf — GET not vulnerable
echo '<form method="GET" action="/search"><input name="q"><button>Search</button></form>';
