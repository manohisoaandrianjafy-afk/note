<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des clients</title>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:    #5B6EF5;
            --primary-lt: #EEF0FE;
            --accent:     #F5A623;
            --green:      #27C98F;
            --red:        #F55B5B;
            --bg:         #F4F6FB;
            --surface:    #FFFFFF;
            --border:     #E8EAF0;
            --text:       #1A1D2E;
            --muted:      #8B8FA8;
            --radius:     14px;
            --shadow:     0 2px 14px rgba(0,0,0,.06);
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg);
            color: var(--text);
        }

        .main {
            padding: 32px;
        }

        /* TOPBAR */
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .topbar h1 {
            font-size: 22px;
            font-weight: 700;
        }

        /* SECTION HEADER */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
        }

        .section-header h2 {
            font-size: 16px;
            font-weight: 700;
        }

        .badge-count {
            background: var(--primary-lt);
            color: var(--primary);
            font-size: 12px;
            font-weight: 700;
            border-radius: 20px;
            padding: 4px 10px;
        }

        /* TABLE CARD */
        .table-card {
            background: var(--surface);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border: 1px solid var(--border);
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #F8F9FC;
        }

        th {
            padding: 13px 18px;
            text-align: left;
            font-size: 11px;
            font-weight: 700;
            color: var(--muted);
            text-transform: uppercase;
        }

        td {
            padding: 14px 18px;
            font-size: 14px;
            border-bottom: 1px solid var(--border);
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background: #F8F9FF;
        }

        /* PILL */
        .pill {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            background: var(--primary-lt);
            color: var(--primary);
        }

        /* BUTTON LINKS */
        td a {
            color: var(--primary);
            font-weight: 600;
            font-size: 13px;
            text-decoration: none;
            margin-right: 6px;
            padding: 6px 12px;
            border-radius: 8px;
            background: var(--primary-lt);
            display: inline-block;
            transition: 0.2s;
        }

        td a:hover {
            background: #dde2fd;
        }

        /* ADD BUTTON */
        .add-btn {
            background: var(--primary);
            color: white;
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .add-btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<main class="main">
    <div class="topbar">
        <h1>Liste des clients</h1>

        <a href="${pageContext.request.contextPath}/client/form" class="add-btn">
            + Ajouter
        </a>
    </div>

    <div class="section-header">
        <h2>Clients enregistrés</h2>
        <span class="badge-count">${clients.size()} clients</span>
    </div>

    
    <div class="table-card">
        <table>
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Contact</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${clients}" var="c">
                    <tr>
                        <td>
                            <span class="pill">${c.nom}</span>
                        </td>
                        <td>${c.contact}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/client/edit/${c.id}">Modifier</a>
                            <a href="${pageContext.request.contextPath}/client/delete/${c.id}">Supprimer</a>
                            <a href="${pageContext.request.contextPath}/demandeClient/historique/${c.id}">Voir la liste des demandes</a>
                            <a href="${pageContext.request.contextPath}/devis/client/${c.id}">Devis</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</main>

</body>
</html>