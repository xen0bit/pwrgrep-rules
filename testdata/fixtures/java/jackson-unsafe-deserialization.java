import com.fasterxml.jackson.databind.ObjectMapper;

public class JacksonDeser {
    public void vuln(String json) throws Exception {
        ObjectMapper om = new ObjectMapper();
        om.enableDefaultTyping();
        // ruleid: jackson-unsafe-deserialization
        Object o = om.readValue(json, Object.class);
    }

    public void vulnAgain(String json) throws Exception {
        ObjectMapper om = new ObjectMapper();
        om.enableDefaultTyping();
        // ruleid: jackson-unsafe-deserialization
        Object o = om.readValue(json, Object.class);
    }

    public void vulnThird(String json) throws Exception {
        ObjectMapper om = new ObjectMapper();
        om.enableDefaultTyping();
        // ruleid: jackson-unsafe-deserialization
        Object o = om.readValue(json, Object.class);
    }

    public void safe(String json) throws Exception {
        ObjectMapper om = new ObjectMapper();
        // ok: jackson-unsafe-deserialization
        Object o = om.readTree(json);
    }

    public void safeAgain(Object value) throws Exception {
        ObjectMapper om = new ObjectMapper();
        // ok: jackson-unsafe-deserialization
        String s = om.writeValueAsString(value);
    }

    public void plain(String json) {
        // ok: jackson-unsafe-deserialization
        System.out.println(json);
    }
}
