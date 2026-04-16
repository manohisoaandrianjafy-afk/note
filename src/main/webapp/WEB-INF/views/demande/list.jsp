<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Liste des demandes</title>

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

        a {
            text-decoration: none;
        }

        .btn-add {
            display: inline-block;
            margin-bottom: 15px;
            padding: 8px 12px;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
        }

        .btn-add:hover {
            background-color: #27ae60;
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
            vertical-align: top;
        }

        tr:hover {
            background-color: #f1f9ff;
        }

        .actions a {
            display: inline-block;
            margin: 3px 0;
            padding: 5px 8px;
            border-radius: 5px;
            font-size: 13px;
            color: white;
        }

        .edit {
            background-color: #f39c12;
        }

        .delete {
            background-color: #e74c3c;
        }

        .status {
            background-color: #3498db;
        }

        .history {
            background-color: #9b59b6;
        }

        .actions a:hover {
            opacity: 0.85;
        }

        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 5px;
            background-color: #ecf0f1;
            font-size: 13px;
        }

    </style>
</head>

<body>

<h2>Liste des demandes</h2>

<a href="/demandeClient/form" class="btn-add">+ Ajouter une demande</a>

<table>
    <tr>
        <th>Client</th>
        <th>Date</th>
        <th>Lieu</th>
        <th>District</th>
        <th>Status</th>
        <th>Observation</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${demandes}" var="d">
        <tr>
            <td>${d.client.nom}</td>
            <td>${d.dateDemande}</td>
            <td>${d.lieu}</td>
            <td>${d.district}</td>
            <td>
                <span class="badge">${d.lastStatus}</span>
            </td>
            <td>
                <span class="badge">${d.lastObservation}</span>
            </td>
            <td class="actions">

                <a href="/demandeClient/edit/${d.id}" class="edit">Modifier</a>
                <a href="/demandeClient/delete/${d.id}" class="delete">Supprimer</a>
                <br>
                <a href="/demandeClient/editStatus/${d.id}" class="status">
                    Modifier Status
                </a>
                <br>
                <a href="/demandeClient/historique/${d.client.id}" class="history">
                    Historique
                </a>

            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>