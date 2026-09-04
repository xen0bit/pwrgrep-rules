// CWE-927: a PendingIntent is handed out with the intent inside it left
// writable.
//
// A PendingIntent is a token that lets another app act as this one. Without
// FLAG_IMMUTABLE the app that receives it can fill in the parts of the wrapped
// Intent this app left blank - the component, the action, the extras - and
// then have this app send it. That is somebody else's intent sent with this
// app's uid and permissions, which is how a notification listener reaches a
// private activity or a content provider it could not otherwise touch.
//
// Since API 31 the flag is compulsory and the platform throws without it. Code
// that predates that has been shipping the mutable form.
package fixture

import android.app.PendingIntent
import android.content.Context
import android.content.Intent

class Notifier(private val ctx: Context) {

    fun reply(): PendingIntent {
        // ruleid: kotlin-mutable-pending-intent
        return PendingIntent.getBroadcast(ctx, 0, Intent(), PendingIntent.FLAG_MUTABLE)
    }

    fun open(): PendingIntent {
        // ruleid: kotlin-mutable-pending-intent
        return PendingIntent.getActivity(ctx, 0, Intent(ctx, Main::class.java), 0)
    }

    fun update(): PendingIntent {
        // ruleid: kotlin-mutable-pending-intent
        return PendingIntent.getService(ctx, 0, Intent(), PendingIntent.FLAG_UPDATE_CURRENT)
    }

    fun safe(): PendingIntent {
        // ok: kotlin-mutable-pending-intent
        return PendingIntent.getActivity(ctx, 0, Intent(ctx, Main::class.java), PendingIntent.FLAG_IMMUTABLE)
    }

    fun safeUpdate(): PendingIntent {
        // ok: kotlin-mutable-pending-intent
        return PendingIntent.getBroadcast(ctx, 0, Intent(), PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
    }
}
