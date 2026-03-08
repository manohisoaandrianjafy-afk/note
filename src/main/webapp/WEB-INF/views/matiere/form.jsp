<html>
<body>

<h2>Ajouter / Modifier Matiere</h2>

<form action="/matiere/save" method="post">

<input type="hidden" name="id" value="${matiere.id}"/>

Nom :
<input type="text" name="nom" value="${matiere.nom}"/>

<button type="submit">Enregistrer</button>

</form>

</body>
</html>