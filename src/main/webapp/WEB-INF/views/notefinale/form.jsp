<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<body>

<h2>Calcul Note Finale</h2>

<form action="/notefinale/calculer" method="post">

Candidat

<select name="idCandidat">

<c:forEach items="${candidats}" var="c">

<option value="${c.id}">${c.nom}</option>

</c:forEach>

</select>

<br><br>

Matiere

<select name="idMatiere">

<c:forEach items="${matieres}" var="m">

<option value="${m.id}">${m.nom}</option>

</c:forEach>

</select>

<br><br>

<button type="submit">Calculer</button>

</form>

</body>

</html>