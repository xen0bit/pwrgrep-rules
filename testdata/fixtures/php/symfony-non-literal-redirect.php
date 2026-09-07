<?php
// Redirecting to a request-supplied URL hands navigation to the attacker.
// Variable destinations flag; literals and bare calls stay quiet.

class NavController
{
    public function go($url)
    {
        // ruleid: symfony-non-literal-redirect
        $this->redirect($url);
        // ruleid: symfony-non-literal-redirect
        $this->redirect($_GET['next']);

        // ok: symfony-non-literal-redirect
        $this->redirect("https://example.com/home");
        // ok: symfony-non-literal-redirect
        $this->redirect();
    }
}
