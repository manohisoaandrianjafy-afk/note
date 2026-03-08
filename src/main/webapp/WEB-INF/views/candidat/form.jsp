<html>
<body>

<h2>Ajouter / Modifier Candidat</h2>

<form action="/candidat/save" method="post">

<input type="hidden" name="id" value="${candidat.id}"/>

Nom :
<input type="text" name="nom" value="${candidat.nom}"/>

Numero :
<input type="text" name="numero" value="${candidat.numero}"/>

<button type="submit">Enregistrer</button>

</form>

</body>
</html>