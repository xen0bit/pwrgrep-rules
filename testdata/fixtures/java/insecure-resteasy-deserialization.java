import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

// ruleid: insecure-resteasy-deserialization
@Consumes({"*/*"})
public class WildResource {
    @GET
    @Path("/get")
    public String get() {
        return "get";
    }
}

// ruleid: insecure-resteasy-deserialization
@Consumes({"application/x-java-serialized-object"})
public class SerialResource {
    @GET
    @Path("/data")
    public String data() {
        return "data";
    }
}

// ruleid: insecure-resteasy-deserialization
@Consumes("*/*")
public class StarResource {
    @GET
    @Path("/star")
    public String star() {
        return "star";
    }
}

// ok: insecure-resteasy-deserialization
@Consumes("application/json")
public class JsonResource {
    @GET
    @Path("/json")
    public String json() {
        return "json";
    }
}

// ok: insecure-resteasy-deserialization
public class PlainResource {
    @GET
    @Path("/plain")
    public String plain() {
        return "plain";
    }
}

// ok: insecure-resteasy-deserialization
class Helper {
    public String help() {
        return "no annotations here";
    }
}
