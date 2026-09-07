// Passing a caller-controlled string to a Turbine peer query is SQL injection.
// The rule keys on a `BasePeer`/`GroupPeer` parameter, so the flagged methods
// keep that shape; a literal query in a peer-less method is fine.
import org.apache.turbine.om.peer.BasePeer;
import org.apache.turbine.om.peer.GroupPeer;

public class TurbineSqli {
    String flag(BasePeer peer, String sql) {
        // ruleid: turbine-sqli
        peer.executeQuery(sql);
        return "done";
    }

    String flagAgain(BasePeer peer, String sql) {
        // ruleid: turbine-sqli
        peer.executeQuery(sql);
        return "done";
    }

    String flagGroup(GroupPeer peer, String sql) {
        // ruleid: turbine-sqli
        peer.executeQuery(sql);
        return "done";
    }

    String safeLiteral(BasePeer peer) {
        // ok: turbine-sqli
        peer.executeQuery("SELECT 1");
        return "done";
    }

    String safeNoPeer(String sql) {
        // ok: turbine-sqli
        return sql;
    }

    String safeStatic() {
        // ok: turbine-sqli
        return "SELECT 1";
    }
}
