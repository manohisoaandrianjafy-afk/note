<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Détails chiffre d'affaire</title>

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
            
            /* HEADER */
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
            
            /* TABLE */
            .table-card {
                background: var(--surface);
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
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
            
            /* TYPE BADGE */
            .pill {
                padding: 4px 10px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 600;
                background: var(--primary-lt);
                color: var(--primary);
            }
            
            /* TOTAL BOX */
            .total-box {
                margin-top: 18px;
                background: var(--surface);
                padding: 16px;
                border-radius: var(--radius);
                border: 1px solid var(--border);
                box-shadow: var(--shadow);
                font-size: 18px;
                font-weight: 700;
                text-align: right;
            }
            
        </style>
    </head>

    <body>

        <main class="main">

            <div class="topbar">
                <h1>Détails du chiffre d'affaire</h1>
            </div>

            <div class="section-header">
                <h2>Liste des opérations</h2>
                <span class="badge-count">${details.size()} lignes</span>
            </div>


            <c:set var="currentType" value="" />

            <c:forEach var="d" items="${details}">


                <c:if test="${d.type ne currentType}">

                    <c:set var="currentType" value="${d.type}" />


                    <div style="
                    margin-top:20px;
                    margin-bottom:10px;
                    font-weight:700;
                    font-size:16px;
                    color:#5B6EF5;
                    background:white;
                    padding:10px 14px;
                    border-radius:12px;
                    border:1px solid #E8EAF0;
                    box-shadow:0 2px 10px rgba(0,0,0,0.05);
                    ">
                    Type : ${d.type}
                </div>

                <!-- TABLE START -->
                <div class="table-card">
                    <table>
                        <thead>
                            <tr>
                                <th>Libellé</th>
                                <th>Prix</th>
                                <th>Quantité</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        </c:if>


                        <tr>
                            <td>${d.libelle}</td>

                            <td>
                                <fmt:formatNumber value="${d.prix}" groupingUsed="true"/> Ar
                                </td>

                                <td>${d.quantite}</td>

                                <td>
                                    <fmt:formatNumber value="${d.total}" groupingUsed="true"/> Ar
                                    </td>
                                </tr>


                                <c:if test="${(empty details[details.indexOf(d)+1]) || details[details.indexOf(d)+1].type ne d.type}">
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                </c:forEach>

                
                <div class="total-box">
                    Total :
                    <fmt:formatNumber value="${totalGeneral}" groupingUsed="true" maxFractionDigits="0"/> Ar
                    </div>

                </main>

            </body>
        </html>