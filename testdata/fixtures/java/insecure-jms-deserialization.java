import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

public class JmsFixture implements MessageListener {
    public void onMessage(Message msg) {
        try {
            ObjectMessage om = (ObjectMessage) msg;
            // ruleid: insecure-jms-deserialization
            Object payload = om.getObject();
            // ruleid: insecure-jms-deserialization
            Object fixed = (Object) om.getObject();
        } catch (Exception e) {
        }
    }
}

class PlainReader {
    public void read(ObjectMessage om) throws Exception {
        // ok: insecure-jms-deserialization
        Object payload = om.getObject();
    }

    public String name(ObjectMessage om) {
        // ok: insecure-jms-deserialization
        return "reader";
    }
}
