<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des devis</title>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:    #5B6EF5;
            --primary-lt: #EEF0FE;
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
            margin-bottom: 28px;
        }

        .topbar h1 {
            font-size: 22px;
            font-weight: 700;
        }

        /* EMPTY */
        .empty {
            color: var(--muted);
            font-style: italic;
            background: var(--surface);
            padding: 14px;
            border-radius: var(--radius);
            border: 1px solid var(--border);
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
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            background: var(--primary-lt);
            color: var(--primary);
        }

        /* BUTTON */
        td a {
            color: var(--primary);
            font-weight: 600;
            font-size: 13px;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 8px;
            background: var(--primary-lt);
            display: inline-block;
            transition: 0.2s;
        }

        td a:hover {
            background: #dde2fd;
        }

    </style>
</head>

<body>

<main class="main">

   
    <div class="topbar">
        <h1>Liste des devis du client</h1>
    </div>

    <c:choose>

        <c:when test="${empty devis}">
            <p class="empty">Ce client n'a pas encore de devis</p>
        </c:when>

        <c:otherwise>

          
            <div class="section-header">
                <h2>Devis disponibles</h2>
                <span class="badge-count">${devis.size()} devis</span>
            </div>

            
            <div class="table-card">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Type</th>
                            <th>Montant</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${devis}" var="d">
                            <tr>
                                <td>#${d.id}</td>

                                <td>
                                    <span class="pill">${d.typeDevis.libelle}</span>
                                </td>

                                <td>
                                    <fmt:formatNumber value="${d.montantTotal}" type="number" groupingUsed="true"/> Ar
                                </td>

                                <td>
                                    <a href="${pageContext.request.contextPath}/devis/${d.id}">
                                        Voir détails
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </c:otherwise>

    </c:choose>

</main>

</body>
</html>