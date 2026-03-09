<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ajouter / Modifier Candidat</title>
    <!-- Google Fonts Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* Reset simple */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f0ff; /* violet très clair */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            color: rgb(82, 187, 236); /* violet foncé */
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

        input[type="text"] {
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
            width: 100%;
            transition: border 0.3s;
        }

        input[type="text"]:focus {
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

    <h2>Ajouter / Modifier Candidat</h2>

    <form action="/candidat/save" method="post">
        <input type="hidden" name="id" value="${candidat.id}"/>

        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="${candidat.nom}"/>

        <label for="numero">Numero :</label>
        <input type="text" id="numero" name="numero" value="${candidat.numero}"/>

        <button type="submit">Enregistrer</button>
    </form>

</body>
</html>