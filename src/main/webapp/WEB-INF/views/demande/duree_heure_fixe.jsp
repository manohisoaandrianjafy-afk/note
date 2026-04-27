<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Durée avec heure fixe (travail réel)</h2>

<table border="1" width="100%">
    <tr>
        <th>Status départ</th>
        <th>Status arrivée</th>
        <th>Durée (minutes)</th>
    </tr>

    <c:forEach items="${durees}" var="d">
        <tr>
            <td>${d.fromStatus}</td>
            <td>${d.toStatus}</td>
            <td><b>${d.duree} min</b></td>
        </tr>
    </c:forEach>
</table>