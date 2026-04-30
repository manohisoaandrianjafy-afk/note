<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Durée entre status</h2>

<table border="1" width="100%">
    <tr>
        <th>Status départ</th>
        <th>Date départ</th>
        <th>Status arrivée</th>
        <th>Date arrivée</th>
        <th>Durée</th>
        <th>Niveau</th>
    </tr>

    <c:forEach items="${durees}" var="d">

        <c:set var="bg" value="white" />

        <c:if test="${d.level == 'Critique'}">
            <c:set var="bg" value="#ffcccc"/>
        </c:if>

        <c:if test="${d.level == 'Eleve'}">
            <c:set var="bg" value="#fff3cd"/>
        </c:if>

        <tr style="background-color:${bg}">
            <td>${d.fromStatus}</td>
            <td>${d.fromDate}</td>
            <td>${d.toStatus}</td>
            <td>${d.toDate}</td>
            <td><b>${d.duree}</b></td>
            <td>${d.level}</td>
        </tr>

    </c:forEach>
</table>