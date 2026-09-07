// Governor-limited operations (email, queueing, approvals) inside loops
// exhaust limits. Move them out of the loop instead.
public class AvoidOperationsWithLimitsInLoops {
    public void vuln() {
        for (Integer i = 0; i < 10; i++) {
            // ruleid: avoid-operations-with-limits-in-loops
            Messaging.sendEmail(new Messaging.SingleEmailMessage());
        }
        for (Integer i = 0; i < 10; i++) {
            // ruleid: avoid-operations-with-limits-in-loops
            System.enqueueJob(new MyQueueable());
        }
        while (true) {
            // ruleid: avoid-operations-with-limits-in-loops
            System.schedule('job', 'cron', new MySchedulable());
            break;
        }
    }
    public void safe() {
        // ok: avoid-operations-with-limits-in-loops
        Messaging.sendEmail(new Messaging.SingleEmailMessage());
        // ok: avoid-operations-with-limits-in-loops
        System.enqueueJob(new MyQueueable());
        for (Integer i = 0; i < 10; i++) {
            String s = 'fixed';
        }
    }
}
