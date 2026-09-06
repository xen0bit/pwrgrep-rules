// CWE-352: CSRF — Spring Security CSRF protection disabled.
// Disabling CSRF allows an attacker to forge a POST from another origin
// that the victim's browser sends with cookies. Keep CSRF enabled.
package fixture;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
class SecurityConfig {

    @Bean
    public void configure1(HttpSecurity http) throws Exception {
        // ruleid: java-csrf-spring
        http.csrf().disable();
    }

    @Bean
    public void configure2(HttpSecurity http) throws Exception {
        // ruleid: java-csrf-spring
        csrf().disable();
    }

    @Bean
    public void configure3(HttpSecurity http) throws Exception {
        // ruleid: java-csrf-spring
        httpSecurity.csrf().disable();
    }

    // ok: java-csrf-spring
    @Bean
    public void safe1(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.csrfTokenRepository(null));
    }

    // ok: java-csrf-spring
    @Bean
    public void safe2(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated());
    }
}
