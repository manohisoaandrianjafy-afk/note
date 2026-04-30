<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Historique des demandes</title>

        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
            
            :root {
                --primary: #5B6EF5;
                --primary-lt: #EEF0FE;
                --bg: #F4F6FB;
                --surface: #FFFFFF;
                --border: #E8EAF0;
                --text: #1A1D2E;
                --muted: #8B8FA8;
                --radius: 14px;
                --shadow: 0 2px 14px rgba(0,0,0,.06);
            }
            
            body {
                font-family: 'DM Sans', sans-serif;
                background: var(--bg);
                color: var(--text);
            }
            
            .main { padding: 32px; }
            
            .topbar { margin-bottom: 28px; }
            
            .topbar h1 {
                font-size: 22px;
                font-weight: 700;
            }
            
            .empty {
                color: var(--muted);
                font-style: italic;
                background: var(--surface);
                padding: 14px;
                border-radius: var(--radius);
                border: 1px solid var(--border);
            }
            
            .demande-card { margin-bottom: 20px; }
            
            .demande-header {
                background: var(--surface);
                padding: 14px 18px;
                border-radius: var(--radius) var(--radius) 0 0;
                border: 1px solid var(--border);
                border-bottom: none;
                font-weight: 600;
            }
            
            .table-card {
                background: var(--surface);
                border-radius: 0 0 var(--radius) var(--radius);
                border: 1px solid var(--border);
                overflow: hidden;
                box-shadow: var(--shadow);
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
            }
            
            thead { background: #F8F9FC; }
            
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
            
            tr:last-child td { border-bottom: none; }
            
            tbody tr:hover { background: #F8F9FF; }
            
            .pill {
                padding: 4px 10px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 600;
                background: var(--primary-lt);
                color: var(--primary);
            }
            
            .total-box {
                background: #eef0fe;
                padding: 10px 18px;
                border: 1px solid #e8eaf0;
                font-weight: 600;
                color: #5B6EF5;
                display: flex;
                gap: 20px;
            }
        </style>
    </head>

    <body>

        <main class="main">

            <div class="topbar">
                <h1>Historique des demandes</h1>
            </div>

            <c:choose>

                <c:when test="${empty demandes}">
                    <p class="empty">Pas encore de demande effectuée</p>
                </c:when>

                <c:otherwise>

                    <c:forEach items="${demandes}" var="d">

                        <div class="demande-card">

                            <!-- HEADER -->
                            <div class="demande-header">
                                Demande du ${d.dateDemande} — ${d.lieu}

                                <!-- SOMME TOTALE -->
                                <div class="total-box">
                                    <div>
                                        Durée totale :
                                        ${dureeService.getTotalDureeTotal(d.id)} h
                                    </div>

                                    <div>
                                        Durée travaillée :
                                        ${dureeService.getTotalDureeTravaille(d.id)} h
                                    </div>
                                </div>
                            </div>

                            <!-- TABLE -->
                            <div class="table-card">
                                <table>

                                    <thead>
                                        <tr>
                                            <th>Statut</th>
                                            <th>Observation</th>
                                            <th>Date</th>
                                            <th>Durée totale</th>
                                            <th>Durée travaillée</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <c:forEach items="${d.statuts}" var="s">

                                            <tr>

                                                <td>
                                                    <span class="pill">${s.status.libelle}</span>
                                                </td>

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

                                                <td>${s.dureeTotal} h</td>

                                                <td>${s.dureeTravaille} h</td>

                                                <td>
                                                    <a href="/demandeClient/editObservation/${s.id}"
                                                    style="color:#3498db;text-decoration:none;">
                                                    Modifier
                                                </a>
                                            </td>

                                        </tr>

                                    </c:forEach>

                                </tbody>

                            </table>
                        </div>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </main>

</body>
</html>