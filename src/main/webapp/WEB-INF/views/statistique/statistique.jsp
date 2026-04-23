<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:    #5B6EF5;
            --primary-lt: #EEF0FE;
            --accent:     #F5A623;
            --green:      #27C98F;
            --red:        #F55B5B;
            --sidebar-w:  220px;
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
            display: flex;
            min-height: 100vh;
        }

        /* ── SIDEBAR ─────────────────────────────── */
        .sidebar {
            width: var(--sidebar-w);
            background: var(--surface);
            border-right: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            padding: 28px 0;
            position: fixed;
            top: 0; left: 0; bottom: 0;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 0 24px 28px;
            font-weight: 700;
            font-size: 17px;
            color: var(--primary);
        }

        .sidebar-brand svg { flex-shrink: 0; }

        .nav-label {
            font-size: 10px;
            font-weight: 600;
            letter-spacing: .08em;
            text-transform: uppercase;
            color: var(--muted);
            padding: 0 24px 8px;
            margin-top: 8px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 11px 24px;
            font-size: 14px;
            font-weight: 500;
            color: var(--muted);
            text-decoration: none;
            border-radius: 0;
            transition: background .15s, color .15s;
            position: relative;
        }

        .nav-item:hover { background: var(--primary-lt); color: var(--primary); }

        .nav-item.active {
            background: var(--primary-lt);
            color: var(--primary);
            font-weight: 600;
        }

        .nav-item.active::before {
            content: '';
            position: absolute;
            left: 0; top: 0; bottom: 0;
            width: 3px;
            background: var(--primary);
            border-radius: 0 3px 3px 0;
        }

        .nav-item svg { width: 18px; height: 18px; flex-shrink: 0; }

        .sidebar-footer {
            margin-top: auto;
            padding: 20px 24px 0;
            border-top: 1px solid var(--border);
        }

        /* ── MAIN ────────────────────────────────── */
        .main {
            margin-left: var(--sidebar-w);
            flex: 1;
            padding: 32px 32px 48px;
        }

        /* TOPBAR */
        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
        }

        .topbar h1 {
            font-size: 22px;
            font-weight: 700;
        }

        .topbar-meta {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .date-badge {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 7px 14px;
            font-size: 13px;
            color: var(--muted);
        }

        .avatar {
            width: 38px; height: 38px;
            background: var(--primary);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-weight: 700; font-size: 14px;
        }

        /* ── KPI GRID ────────────────────────────── */
        .kpi-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 18px;
            margin-bottom: 24px;
        }

        .kpi-card {
            background: var(--surface);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 22px 22px 18px;
            display: flex;
            flex-direction: column;
            gap: 6px;
            border: 1px solid var(--border);
            transition: transform .18s, box-shadow .18s;
        }

        .kpi-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 28px rgba(0,0,0,.1);
        }

        .kpi-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .kpi-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--muted);
            letter-spacing: .04em;
            text-transform: uppercase;
        }

        .kpi-icon {
            width: 36px; height: 36px;
            border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
        }

        .kpi-icon.blue  { background: #EEF0FE; color: var(--primary); }
        .kpi-icon.green { background: #E6FAF3; color: var(--green); }
        .kpi-icon.amber { background: #FEF6E6; color: var(--accent); }

        .kpi-value {
            font-size: 28px;
            font-weight: 700;
            letter-spacing: -.02em;
            line-height: 1;
        }

        .kpi-link {
            font-size: 12px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            margin-top: 4px;
        }

        .kpi-link:hover { text-decoration: underline; }

        /* ── TABLE SECTION ───────────────────────── */
        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
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
            padding: 3px 10px;
        }

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

        thead tr {
            background: #F8F9FC;
            border-bottom: 1px solid var(--border);
        }

        th {
            padding: 13px 18px;
            text-align: left;
            font-size: 11px;
            font-weight: 700;
            color: var(--muted);
            letter-spacing: .07em;
            text-transform: uppercase;
        }

        td {
            padding: 14px 18px;
            font-size: 14px;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        tr:last-child td { border-bottom: none; }

        tbody tr { transition: background .12s; }
        tbody tr:hover { background: #F8F9FF; }

        /* Status pill */
        .pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .pill-default { background: #F0F2FF; color: var(--primary); }

        /* Table link */
        td a {
            color: var(--primary);
            font-weight: 600;
            font-size: 13px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 6px 14px;
            border-radius: 8px;
            background: var(--primary-lt);
            transition: background .14s;
        }

        td a:hover { background: #dde2fd; }
    </style>
</head>
<body>

<main class="main">

 
    <div class="topbar">
        <h1>Tableau de Bord</h1>
        <div class="topbar-meta">
            <span class="date-badge">
                <fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd MMM yyyy"/>
            </span>
            <div class="avatar">A</div>
        </div>
    </div>

   
    <div class="kpi-grid">

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-label">Chiffre d'affaire</span>
                <div class="kpi-icon green">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                    </svg>
                </div>
            </div>
            <div class="kpi-value">
                <fmt:formatNumber value="${chiffre}" type="number" groupingUsed="true" maxFractionDigits="0"/>
            </div>
            <a class="kpi-link" href="${pageContext.request.contextPath}/devis/detailsSimple">
                Voir le détail →
            </a>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-label">Clients</span>
                <div class="kpi-icon blue">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                </div>
            </div>
            <div class="kpi-value">${totalClient}</div>
            <a class="kpi-link" href="${pageContext.request.contextPath}/client/list">
                Voir les clients →
            </a>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-label">Devis</span>
                <div class="kpi-icon amber">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                        <polyline points="14 2 14 8 20 8"/>
                        <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/>
                    </svg>
                </div>
            </div>
            <div class="kpi-value">${totalDevis}</div>
            <a class="kpi-link" href="${pageContext.request.contextPath}/devis/list">
                Voir les devis →
            </a>
        </div>

    </div>

    <!-- Statistics Table -->
    <div class="section-header">
        <h2>Statistiques par statut</h2>
        <span class="badge-count">${statsStatus.size()} statuts</span>
    </div>

    <div class="table-card">
        <table>
            <thead>
                <tr>
                    <th>Statut</th>
                    <th>Nombre</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${statsStatus}">
                    <tr>
                        <td><span class="pill pill-default">${s[0]}</span></td>
                        <td><strong>${s[1]}</strong></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/statistique/statut/${s[0]}">
                                Voir détails →
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</main>
</body>
</html>
