<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html><body>
<%-- ruleid: spring-jsp-eval --%>
<spring:eval expression="@user.name" var="userName" />
<%-- ruleid: spring-jsp-eval --%>
<spring:eval expression="@order.total" var="total" />
<%-- ruleid: spring-jsp-eval --%>
<spring:eval expression="@cart.count" var="count" />
<%-- ok: spring-jsp-eval --%>
<spring:message code="label.hello" />
<%-- ok: spring-jsp-eval --%>
<c:out value="${user.name}" />
<%-- ok: spring-jsp-eval --%>
<p>static markup</p>
</body></html>
