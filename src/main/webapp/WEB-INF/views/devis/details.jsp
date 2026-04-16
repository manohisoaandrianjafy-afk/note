<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Détails du devis</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 20px;
            color: #333;
        }

        h2, h3 {
            color: #2c3e50;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-top: 15px;
        }

        th {
            background-color: #121313;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background-color: #f1f9ff;
        }

        p {
            background: white;
            padding: 10px;
            border-radius: 6px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.05);
            margin: 8px 0;
        }

        .btn-retour {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color:  #2ecc71;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .btn-retour:hover {
            background-color:  #2ecc71;
        }
    </style>
</head>

<body>

<h2>Détails du devis</h2>

<p><strong>Client :</strong> ${devis.demande.client.nom}</p>
<p><strong>Date :</strong> ${devis.demande.dateDemande}</p>
<p><strong>Lieu :</strong> ${devis.demande.lieu}</p>

<h3>Détails</h3>

<table>
    <tr>
        <th>Libellé</th>
        <th>Prix</th>
        <th>Quantité</th>
        <th>Montant</th>
    </tr>

    <c:forEach var="detail" items="${devis.details}">
        <tr>
            <td>${detail.libelle}</td>
            <td>${detail.prix}</td>
            <td>${detail.quantite}</td>
            <td>
                <fmt:formatNumber value="${detail.prix * detail.quantite}" groupingUsed="true"/>
            </td>
        </tr>
    </c:forEach>
</table>

<h3>
    Total :
    <fmt:formatNumber value="${devis.montantTotal}" groupingUsed="true" maxFractionDigits="0"/>
</h3>

<a href="/devis" class="btn-retour">⬅ Retour</a>

</body>
</html>