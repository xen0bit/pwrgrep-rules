// CWE-89: SQL Injection via sqlx query with untrusted input
//
// Passing user input directly as the SQL string lets an attacker inject
// arbitrary SQL. The sink is sqlx::query with tainted data.

fn vuln() {
    let input = std::env::var("USER_INPUT").unwrap();
    // ruleid: rust-sqli
    let _ = sqlx::query(&input);
    let data = std::env::args().next().unwrap();
    // ruleid: rust-sqli
    let _ = sqlx::query(&data);
    let propagated = input;
    // ruleid: rust-sqli
    let _ = sqlx::query(&propagated);
}

fn safe() {
    // ok: rust-sqli
    let _ = sqlx::query("SELECT * FROM users WHERE id=1");
    // ok: rust-sqli
    let _ = sqlx::query("SELECT * FROM t WHERE name='fixed'");
    // ok: rust-sqli
    let _ = sqlx::query("SELECT * FROM users");
}
