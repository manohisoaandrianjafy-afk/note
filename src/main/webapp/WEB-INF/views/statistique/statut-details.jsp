<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Demandes par statut</title>

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
                margin-bottom: 24px;
            }
            
            .topbar h1 {
                font-size: 22px;
                font-weight: 700;
            }
            
            /* TABLE CARD */
            .table-card {
                background: var(--surface);
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
                overflow: hidden; 
                margin-top: 16px;
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
            
            /* HEADER INFO */
            .subtitle {
                font-size: 14px;
                color: var(--muted);
                margin-top: 4px;
            }
            
            /* BUTTON LINKS */
            td a {
                display: inline-block;
                text-decoration: none;
                background: var(--primary-lt);
                color: var(--primary);
                padding: 6px 12px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 13px;
                margin-right: 6px;
                transition: 0.2s;
            }
            
            td a:hover {
                background: #dde2fd;
            }
            
            /* BACK BUTTON */
            .back {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                background: var(--primary);
                color: white;
                padding: 10px 16px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
            }
            
            .back:hover {
                opacity: 0.9;
            }
            
            /* BADGE TITLE */
            .badge {
                display: inline-block;
                margin-top: 6px;
                background: var(--primary-lt);
                color: var(--primary);
                font-size: 12px;
                font-weight: 700;
                border-radius: 20px;
                padding: 4px 10px;
            }
            
        </style>
    </head>

    <body>

        <main class="main">

            <!-- TITLE -->
            <div class="topbar">
                <h1>Demandes</h1>
                <div class="subtitle">Statut filtré</div>
                <span class="badge">${statut}</span>
            </div>

            <!-- TABLE -->
            <div class="table-card">

                <table>
                    <thead>
                        <tr>
                            <th>Client</th>
                            <th>Date demande</th>
                            <th>Lieu</th>
                            <th>District</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="d" items="${demandes}">
                            <tr>

                                <td>${d.client.nom}</td>

                                <td>${d.dateDemande}</td>

                                <td>${d.lieu}</td>

                                <td>${d.district}</td>

                                <td>
                                    <a href="${pageContext.request.contextPath}/demandeClient/historique/${d.client.id}">
                                        Demandes
                                    </a>

                                    <a href="${pageContext.request.contextPath}/devis/client/${d.client.id}">
                                        Devis
                                    </a>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>

            <!-- BACK -->
            <a href="${pageContext.request.contextPath}/statistique" class="back">
             Retour
            </a>

        </main>

    </body>
</html>