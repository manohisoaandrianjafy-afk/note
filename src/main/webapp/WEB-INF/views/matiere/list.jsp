<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

<h2>Liste des matieres</h2>

<a href="/matiere/new">Ajouter</a>

<table border="1">

<tr>
<th>ID</th>
<th>Nom</th>
<th>Action</th>
</tr>

<c:forEach items="${matieres}" var="m">

<tr>
<td>${m.id}</td>
<td>${m.nom}</td>

<td>
<a href="/matiere/edit/${m.id}">Modifier</a>
<a href="/matiere/delete/${m.id}">Supprimer</a>
</td>

</tr>

</c:forEach>

</table>

</body>
</html>