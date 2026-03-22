<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Formulaire Demande</h2>

<form action="/demandeClient/save" method="post">

    <input type="hidden" name="id" value="${demande.id}" />

    Client :
    <select name="client.id">
        <c:forEach items="${clients}" var="c">
            <option value="${c.id}"
                <c:if test="${demande.client != null && demande.client.id == c.id}">
                    selected
                </c:if>
            >
                ${c.nom}
            </option>
        </c:forEach>
    </select>
    <br><br>

    Date :
    <input type="date" name="dateDemande" value="${demande.dateDemande}" />
    <br><br>

    Lieu :
    <input type="text" name="lieu" value="${demande.lieu}" />
    <br><br>

    District :
    <input type="text" name="district" value="${demande.district}" />
    <br><br>

    <button type="submit">Enregistrer</button>

</form>