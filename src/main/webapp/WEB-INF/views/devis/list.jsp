<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Liste details devis</h2>

<c:forEach var="d" items="${devis}">

        <table border="1" width="100%">
            <tr>
                <th>Demande</th>
                <th>Libellé</th>
                <th>Prix</th>
                <th>Quantité</th>
                <th>Montant</th>
            </tr>

            <c:forEach var="detail" items="${d.details}">
                <tr>
                    <td>${detail.libelle}</td>
                    <td>${detail.prix}</td>
                    <td>${detail.quantite}</td>
                    <td>${detail.prix * detail.quantite}</td>
                </tr>
            </c:forEach>

        </table>

    </div>
</c:forEach>