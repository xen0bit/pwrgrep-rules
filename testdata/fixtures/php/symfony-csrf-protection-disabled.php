<?php
// Disabling CSRF protection leaves the form open to forged submissions.
// Literal-false options flag; enabled and default forms stay quiet.

class FormFlow
{
    public function build($x, $type, $task)
    {
        // ruleid: symfony-csrf-protection-disabled
        $a = $x->createForm($type, $task, ['csrf_protection' => false]);
        // ruleid: symfony-csrf-protection-disabled
        $b = $x->setDefaults(['csrf_protection' => false]);

        // ok: symfony-csrf-protection-disabled
        $c = $x->createForm($type, $task, ['csrf_protection' => true]);
        // ok: symfony-csrf-protection-disabled
        $d = $x->createForm($type, $task);
    }
}
