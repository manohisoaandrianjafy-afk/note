<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Détails du devis</title>

        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
            
            :root {
                --primary:    #5B6EF5;
                --primary-lt: #EEF0FE;
                --green:      #27C98F;
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
            
            /* INFO CARDS */
            .info-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 16px;
                margin-bottom: 20px;
            }
            
            .info-card {
                background: var(--surface);
                padding: 16px;
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
            }
            
            .info-label {
                font-size: 12px;
                color: var(--muted);
                margin-bottom: 5px;
            }
            
            .info-value {
                font-size: 15px;
                font-weight: 600;
            }
            
            /* TABLE */
            .table-card {
                background: var(--surface);
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
                overflow: hidden;
                margin-top: 10px;
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
            
            /* TOTAL */
            .total-box {
                margin-top: 18px;
                background: var(--surface);
                padding: 16px;
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
                font-size: 18px;
                font-weight: 700;
            }
            
            /* BUTTON */
            .btn-retour {
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
            
            .btn-retour:hover {
                opacity: 0.9;
            }
        </style>
    </head>

    <body>

        <main class="main">

           
            <div class="topbar">
                <h1>Détails du devis</h1>
            </div>

            
            <div class="info-grid">

                <div class="info-card">
                    <div class="info-label">Client</div>
                    <div class="info-value">${devis.demande.client.nom}</div>
                </div>

                <div class="info-card">
                    <div class="info-label">Date</div>
                    <div class="info-value">
                        <fmt:formatDate value="${devis.demande.dateDemande}" pattern="dd MMM yyyy"/>
                    </div>
                </div>

                <div class="info-card">
                    <div class="info-label">Lieu</div>
                    <div class="info-value">${devis.demande.lieu}</div>
                </div>

            </div>

            
            <div class="table-card">
                <table>
                    <thead>
                        <tr>
                            <th>Libellé</th>
                            <th>Prix</th>
                            <th>Quantité</th>
                            <th>Montant</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="detail" items="${devis.details}">
                            <tr>
                                <td>${detail.libelle}</td>

                                <td>
                                    <fmt:formatNumber value="${detail.prix}" groupingUsed="true"/> Ar
                                    </td>

                                    <td>${detail.quantite}</td>

                                    <td>
                                        <fmt:formatNumber value="${detail.prix * detail.quantite}" groupingUsed="true"/> Ar
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- TOTAL -->
                    <div class="total-box">
                        Total :
                        <fmt:formatNumber value="${devis.montantTotal}" groupingUsed="true" maxFractionDigits="0"/> Ar
                        </div>

                        <!-- BACK -->
                        <a href="${pageContext.request.contextPath}/devis" class="btn-retour">
                            ⬅ Retour
                        </a>

                    </main>

                </body>
            </html>