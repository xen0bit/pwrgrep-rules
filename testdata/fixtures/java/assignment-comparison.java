public class AssignCompare {
    public boolean vuln(boolean flag) {
        // ruleid: assignment-comparison
        if (flag = true) {
            return true;
        }
        return false;
    }

    public boolean vulnAgain(boolean flag) {
        // ruleid: assignment-comparison
        if (flag = false) {
            return true;
        }
        return false;
    }

    public boolean vulnThird(boolean flag) {
        // ruleid: assignment-comparison
        if (flag = true) {
            return flag;
        }
        return false;
    }

    public boolean safe(boolean flag) {
        // ok: assignment-comparison
        if (flag == true) {
            return true;
        }
        return false;
    }

    public boolean safeAgain(boolean flag) {
        // ok: assignment-comparison
        if (flag) {
            return true;
        }
        return false;
    }

    public boolean plain(boolean flag) {
        // ok: assignment-comparison
        flag = true;
        return flag;
    }
}
