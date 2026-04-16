<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Liste des devis</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 20px;
            color: #333;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
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

        a {
            text-decoration: none;
            color: white;
            background-color: #2ecc71;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 14px;
        }

        a:hover {
            background-color: #27ae60;
        }
    </style>
</head>

<body>

<h2>Liste des devis</h2>

<table>
    <tr>
        <th>Client</th>
        <th>Date demande</th>
        <th>Lieu</th>
        <th>Montant total</th>
        <th>Action</th>
    </tr>

    <c:forEach var="d" items="${devis}">
        <tr>
            <td>${d.demande.client.nom}</td>
            <td>${d.demande.dateDemande}</td>
            <td>${d.demande.lieu}</td>
            <td>
                <fmt:formatNumber value="${d.montantTotal}" groupingUsed="true" maxFractionDigits="0"/>
            </td>
            <td>
                <a href="/devis/${d.id}">Voir détails</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>