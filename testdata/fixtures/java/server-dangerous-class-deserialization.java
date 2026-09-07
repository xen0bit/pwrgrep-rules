import java.rmi.Remote;
import java.rmi.RemoteException;

// ruleid: server-dangerous-class-deserialization
public interface FetchRemote extends Remote {
    String fetch(Data param) throws RemoteException;
}

// ruleid: server-dangerous-class-deserialization
interface LoadRemote extends Remote {
    Object load(Query param) throws RemoteException;
}

// ruleid: server-dangerous-class-deserialization
interface SaveRemote extends Remote {
    boolean save(Record param) throws RemoteException;
}

// ok: server-dangerous-class-deserialization
interface CountRemote extends Remote {
    int count(int n) throws RemoteException;
}

// ok: server-dangerous-class-deserialization
interface Plain {
    String fetch(Data param);
}

// ok: server-dangerous-class-deserialization
class Helper {
    public String help() {
        return "no rmi here";
    }
}
