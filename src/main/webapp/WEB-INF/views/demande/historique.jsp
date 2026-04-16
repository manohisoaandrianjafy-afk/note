<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Historique des demandes</title>

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

        h3 {
            color: #34495e;
            margin-top: 25px;
            background: white;
            padding: 10px;
            border-radius: 6px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.05);
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        th {
            background-color:  #121313;
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

        .empty {
            color: #7f8c8d;
            font-style: italic;
        }
    </style>
</head>

<body>

<h2>Historique des demandes</h2>

<c:forEach items="${demandes}" var="d">

    <h3>
        Demande du ${d.dateDemande} - ${d.lieu}
    </h3>

    <table>
        <tr>
            <th>Status</th>
            <th>Observation</th>
            <th>Date</th>
        </tr>

        <c:forEach items="${d.statuts}" var="s">
            <tr>
                <td>${s.status.libelle}</td>
                <td>
                    <c:choose>
                        <c:when test="${empty s.observation}">
                            <span class="empty">Pas d'observation</span>
                        </c:when>
                        <c:otherwise>
                            ${s.observation}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${s.dateStatus}</td>
            </tr>
        </c:forEach>
    </table>

</c:forEach>

</body>
</html>