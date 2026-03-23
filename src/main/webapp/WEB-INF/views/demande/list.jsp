<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Liste des demandes</h2>

<a href="/demandeClient/form">Ajouter une demande</a>

<table border="1">
    <tr>
        <th>Client</th>
        <th>Date</th>
        <th>Lieu</th>
        <th>District</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${demandes}" var="d">
        <tr>
            <td>${d.client.nom}</td>
            <td>${d.dateDemande}</td>
            <td>${d.lieu}</td>
            <td>${d.district}</td>
            <td>
                <a href="/demandeClient/edit/${d.id}">Modifier</a>
                <a href="/demandeClient/delete/${d.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>