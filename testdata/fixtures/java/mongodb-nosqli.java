import com.mongodb.BasicDBObject;

public class MongoNoSqli {
    public void vuln(String input) {
        // ruleid: mongodb-nosqli
        com.mongodb.BasicDBObject query = new com.mongodb.BasicDBObject("$where", input);
    }

    public void vulnAgain(String input) {
        // ruleid: mongodb-nosqli
        com.mongodb.BasicDBObject query = new com.mongodb.BasicDBObject("$where", input);
    }

    public void vulnThird(String input) {
        // ruleid: mongodb-nosqli
        com.mongodb.BasicDBObject query = new com.mongodb.BasicDBObject("$where", input);
    }

    public void safe(String name) {
        // ok: mongodb-nosqli
        com.mongodb.BasicDBObject query = new com.mongodb.BasicDBObject("name", name);
    }

    public void safeAgain() {
        // ok: mongodb-nosqli
        com.mongodb.BasicDBObject query = new com.mongodb.BasicDBObject();
    }

    public void plain(String input) {
        // ok: mongodb-nosqli
        System.out.println(input);
    }
}
