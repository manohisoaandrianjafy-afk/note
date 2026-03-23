<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Ajouter un statut</h2>

<form action="/demandeStatus/save" method="post">

    Demande :
    <select name="demande.id">
        <c:forEach items="${demandes}" var="d">
            <option value="${d.id}">
                ${d.client.nom} - ${d.lieu}
            </option>
        </c:forEach>
    </select>
    <br><br>

    Statut :
    <select name="status.id">
        <c:forEach items="${statuses}" var="s">
            <option value="${s.id}">
                ${s.libelle}
            </option>
        </c:forEach>
    </select>
    <br><br>

    <button type="submit">Enregistrer</button>

</form>