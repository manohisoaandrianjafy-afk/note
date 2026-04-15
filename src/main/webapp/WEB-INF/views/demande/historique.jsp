<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Historique des demandes</h2>

<c:forEach items="${demandes}" var="d">
    
    <h3>Demande du ${d.dateDemande} - ${d.lieu}</h3>

    <table border="1">
        <tr>
            <th>Status</th>
            <th>Observation</th>
            <th>Date</th>
        </tr>

        <c:forEach items="${d.statuts}" var="s">
            <tr>
                <td>${s.status.libelle}</td>
                <td>
                    ${empty s.observation ? 'Pas d\'observation' : s.observation}
                </td>
                <td>${s.dateStatus}</td>
            </tr>
        </c:forEach>
    </table>

    <br>
</c:forEach>