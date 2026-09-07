import org.springframework.security.config.annotation.web.builders.HttpSecurity;

public class SecurityConfig {
    public void vuln(HttpSecurity http) throws Exception {
        // ruleid: spring-csrf-disabled
        http.csrf().disable();
    }

    public void vulnAgain(HttpSecurity http) throws Exception {
        // ruleid: spring-csrf-disabled
        http.csrf().disable();
    }

    public void vulnThird(HttpSecurity http) throws Exception {
        // ruleid: spring-csrf-disabled
        http.csrf().disable();
    }

    public void safe(HttpSecurity http) throws Exception {
        // ok: spring-csrf-disabled
        http.csrf().ignoringRequestMatchers("/api/**");
    }

    public void safeAgain(HttpSecurity http) throws Exception {
        // ok: spring-csrf-disabled
        http.authorizeHttpRequests();
    }

    public void plain() {
        // ok: spring-csrf-disabled
        System.out.println("csrf in a comment is not a call");
    }
}
