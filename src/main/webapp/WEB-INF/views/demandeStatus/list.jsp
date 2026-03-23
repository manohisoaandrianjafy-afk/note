<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Historique des statuts</h2>

<a href="/demandeStatus/form">Ajouter statut</a>

<table border="1">
    <tr>
        <th>Client</th>
        <th>Statut</th>
        <th>Date</th>
    </tr>

    <c:forEach items="${list}" var="ds">
        <tr>
            <td>${ds.demande.client.nom}</td>
            <td>${ds.status.libelle}</td>
            <td>${ds.dateStatus}</td>
        </tr>
    </c:forEach>
</table>