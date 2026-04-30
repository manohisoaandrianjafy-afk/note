<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <title>Modifier Status</title>

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
            
            form {
                background: white;
                padding: 20px;
                border-radius: 8px;
                width: 400px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            }
            
            label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
                margin-bottom: 5px;
                color: #2c3e50;
            }
            
            select, input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 6px;
                outline: none;
                font-size: 14px;
            }
            
            select:focus, input:focus {
                border-color: #3498db;
            }
            
            button {
                margin-top: 20px;
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #3498db;
                color: white;
                font-size: 15px;
                border-radius: 6px;
                cursor: pointer;
            }
            
            button:hover {
                background-color: #2980b9;
            }
        </style>
    </head>

    <body>

        <h2>Modifier Status</h2>

        <form action="/demandeClient/saveStatus" method="post">

            <input type="hidden" name="idDemande" value="${demande.id}" />
   <input type="hidden" name="idStatusDemande" value="${status.id}" />
            <label>Status :</label>
            <select name="idStatus">
                <c:forEach items="${statuses}" var="s">
                    <option value="${s.id}">${s.libelle}</option>
                </c:forEach>
            </select>

            <label>Observation :</label>
            <input type="text" name="observation" />

            <label>Date du status :</label>
            <input type="datetime-local" name="dateStatus" />

            <button type="submit">Valider</button>

        </form>

    </body>
</html>