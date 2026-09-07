import java.rmi.Remote;
import java.rmi.RemoteException;

// ruleid: server-dangerous-object-deserialization
public interface FetchRemote extends Remote {
    String fetch(Data param) throws RemoteException;
}

// ruleid: server-dangerous-object-deserialization
interface LoadRemote extends Remote {
    Object load(Query param) throws RemoteException;
}

// ruleid: server-dangerous-object-deserialization
interface SaveRemote extends Remote {
    boolean save(Record param) throws RemoteException;
}

// ok: server-dangerous-object-deserialization
interface LocalStore {
    int count(int n);
}

// ok: server-dangerous-object-deserialization
interface Plain {
    String fetch(Data param);
}

// ok: server-dangerous-object-deserialization
class Helper {
    public String help() {
        return "no rmi here";
    }
}
