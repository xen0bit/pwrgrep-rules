// CWE-319: the socket is not encrypted.
//
// A plain Socket carries what is written to it in the clear, and on a phone
// the network belongs to a café, a captive portal or a carrier. The encrypted
// spellings go through a factory, which is what makes them invisible to this
// rule rather than excluded by it.
package fixture

import java.net.ServerSocket
import java.net.Socket
import javax.net.ssl.SSLSocketFactory

class Wire {

    fun connect(): Socket {
        // ruleid: unencrypted-socket
        return Socket("api.example.com", 80)
    }

    fun listen(): ServerSocket {
        // ruleid: unencrypted-socket
        return ServerSocket(8080)
    }

    fun secure(): Socket {
        // ok: unencrypted-socket
        return SSLSocketFactory.getDefault().createSocket("api.example.com", 443)
    }
}
