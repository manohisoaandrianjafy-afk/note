<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Candidats</title>
    <!-- Google Fonts Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* Reset simple */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f0ff; /* violet très clair */
            text-align: center;
        }

        h2 {
            color: rgb(82, 187, 236); /* violet foncé */
            font-size: 1.8em;
            font-weight: 600;
            margin-top: 20px;
        }

        /* Lien Ajouter */
        a.add-btn {
            display: inline-block;
            margin: 15px 0;
            padding: 10px 20px;
            background-color: rgb(82, 187, 236);
            color: white;
            text-decoration: none;
            font-weight: 600;
            border-radius: 10px;
            transition: opacity 0.3s, transform 0.3s;
        }

        a.add-btn:hover {
            opacity: 0.8;
            transform: translateY(-2px);
        }

        /* Table style */
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 85%;
            max-width: 900px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 12px 20px rgba(73, 73, 73, 0.11);
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            border-bottom: 1px solid #ddd;
            font-weight: 500;
            color: #333;
        }

        th {
            background-color: rgb(82, 187, 236);
            color: white;
            font-size: 1em;
        }

        tr:hover {
            background-color: #f0e6ff;
        }

        /* Action links */
        .action-link {
            color: white;
            text-decoration: none;
            padding: 6px 12px;
            margin: 0 4px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.9em;
            transition: opacity 0.3s, transform 0.2s;
        }

        .edit {
            background-color: #4caf50; /* vert */
        }

        .edit:hover {
            opacity: 0.8;
            transform: translateY(-1px);
        }

        .delete {
            background-color: #f44336; /* rouge */
        }

        .delete:hover {
            opacity: 0.8;
            transform: translateY(-1px);
        }
    </style>
</head>

<body>

    <h2>Liste des Candidats</h2>

    <a href="/candidat/new" class="add-btn">Ajouter</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Numero</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${candidats}" var="c">
        <tr>
            <td>${c.id}</td>
            <td>${c.nom}</td>
            <td>${c.numero}</td>
            <td>
                <a href="/candidat/edit/${c.id}" class="action-link edit">Modifier</a>
                <a href="/candidat/delete/${c.id}" class="action-link delete">Supprimer</a>
            </td>
        </tr>
        </c:forEach>
    </table>

</body>
</html>