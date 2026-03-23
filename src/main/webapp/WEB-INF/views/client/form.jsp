<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="/client/save" method="post">

    <input type="hidden" name="id" value="${client.id}"/>

    Nom: 
    <input type="text" name="nom" value="${client.nom}"><br>

    Contact: 
    <input type="text" name="contact" value="${client.contact}"><br>

    <button type="submit">Enregistrer</button>

</form>