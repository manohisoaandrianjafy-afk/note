<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Liste des clients</h2>
<a href="/client/form">Ajouter</a>

<table border="1">
<tr>
    <th>Nom</th>
    <th>Contact</th>
    <th>Action</th>
</tr>

<c:forEach items="${clients}" var="c">
<tr>
    <td>${c.nom}</td>
    <td>${c.contact}</td>
    <td>
        <a href="/client/edit/${c.id}">Modifier</a>
        <a href="/client/delete/${c.id}">Supprimer</a>
    </td>
</tr>
</c:forEach>
</table>