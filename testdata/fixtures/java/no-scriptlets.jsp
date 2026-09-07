<html><body>
<!-- ruleid: no-scriptlets -->
<% String greeting = "hi"; %>
<!-- ruleid: no-scriptlets -->
<%= greeting %>
<!-- ruleid: no-scriptlets -->
<% out.println(greeting); %>
<!-- ok: no-scriptlets -->
<%@ page import="java.util.*" %>
<!-- ok: no-scriptlets -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ok: no-scriptlets -->
<p>static markup</p>
</body></html>
