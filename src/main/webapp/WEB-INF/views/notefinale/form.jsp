<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Calcul Note Finale</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
       
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f0ff; 
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            color: rgb(82, 187, 236); 
            font-size: 1.8em;
            font-weight: 600;
            margin-top: 40px;
        }

        form {
            background: #fff;
            padding: 30px 40px;
            margin: 20px 0;
            border-radius: 15px;
            box-shadow: 0 12px 20px rgba(73, 73, 73, 0.11);
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 350px;
        }

        label {
            font-weight: 600;
            color: #333;
            text-align: left;
            display: block;
        }

        select {
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
            width: 100%;
            transition: border 0.3s;
        }

        select:focus {
            border-color: rgb(82, 187, 236);
            outline: none;
        }

        button {
            padding: 12px;
            background-color: rgb(82, 187, 236);
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: opacity 0.3s, transform 0.2s;
        }

        button:hover {
            opacity: 0.85;
            transform: translateY(-2px);
        }
    </style>
</head>

<body>

    <h2>Calcul Note Finale</h2>

    <form action="/notefinale/calculer" method="post">
        <label for="idCandidat">Candidat :</label>
        <select id="idCandidat" name="idCandidat">
            <c:forEach items="${candidats}" var="c">
                <option value="${c.id}">${c.nom}</option>
            </c:forEach>
        </select>

        <label for="idMatiere">Matière :</label>
        <select id="idMatiere" name="idMatiere">
            <c:forEach items="${matieres}" var="m">
                <option value="${m.id}">${m.nom}</option>
            </c:forEach>
        </select>

        <button type="submit">Calculer</button>
    </form>

</body>
</html>