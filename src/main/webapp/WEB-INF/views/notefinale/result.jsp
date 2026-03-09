<html>
<head>
    <title>Note Finale</title>
    <!-- Google Fonts Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f0ff; /* violet très clair */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            justify-content: center;
            text-align: center;
        }

        h2 {
            color: rgb(82, 187, 236); /* violet foncé */
            font-size: 2em;
            font-weight: 700;
            margin-bottom: 20px;
        }

        h3 {
            background: #fff;
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 12px 20px rgba(73, 73, 73, 0.11);
            font-weight: 600;
            color: #333;
            margin-bottom: 30px;
        }

        a {
            padding: 12px 25px;
            background-color: rgb(82, 187, 236);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: opacity 0.3s, transform 0.2s;
        }

        a:hover {
            opacity: 0.85;
            transform: translateY(-2px);
        }
    </style>
</head>

<body>

    <h2>Note Finale</h2>

    <h3>${resultat}</h3>

    <a href="/notefinale/form">Retour</a>

</body>
</html>