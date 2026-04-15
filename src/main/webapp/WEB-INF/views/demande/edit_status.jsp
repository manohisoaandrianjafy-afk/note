<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Modifier Status</h2>

<form action="/demandeClient/saveStatus" method="post">
    
    <input type="hidden" name="idDemande" value="${demande.id}" />

    <label>Status :</label>
    <select name="idStatus">
        <c:forEach items="${statuses}" var="s">
            <option value="${s.id}">${s.libelle}</option>
        </c:forEach>
    </select>

    <br><br>

    <label>Observation :</label>
    <input type="text" name="observation" />

    <br><br>

    <button type="submit">Valider</button>
</form>