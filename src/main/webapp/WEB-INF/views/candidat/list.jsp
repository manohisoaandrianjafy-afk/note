<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Candidats</title>
</head>

<body>

<h2>Liste des candidats</h2>

<a href="/candidat/new">Ajouter</a>

<table border="1">
<tr>
<th>ID</th>
<th>Nom</th>
<th>Numero</th>
<th>Action</th>
</tr>

<c:forEach items="${candidats}" var="c">
<tr>
<td>${c.id}</td>
<td>${c.nom}</td>
<td>${c.numero}</td>

<td>
<a href="/candidat/edit/${c.id}">Modifier</a>
<a href="/candidat/delete/${c.id}">Supprimer</a>
</td>

</tr>
</c:forEach>

</table>

</body>
</html>