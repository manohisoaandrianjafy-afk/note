<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>
    <title>Accueil</title>
 
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
      
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }


        .navbar {
            background-color:  rgb(82, 187, 236); 
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size:8 pt;
            font-weight: 700;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 600;
            transition: opacity 0.3s;
        }

        .navbar a:hover {
            opacity: 0.8;
        }

       
        body {
            background: #f5f0ff; 
            text-align: center;
        }

        h2 {
            color: rgb(82, 187, 236); 
            font-size: 1.8em;
            font-weight: 600;
        }

        
        .card-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            padding: 20px;
        }

       
        .card {
            background: linear-gradient(145deg, #ffffff, #ffffff);
            color: rgb(82, 187, 236);
            width: 450px;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-weight: 600;
            font-size: 14pt;
            border-radius: 20px;
            box-shadow: 0 12px 20px rgba(73, 73, 73, 0.11);
            transition: transform 0.3s, box-shadow 0.3s;
            font-family: 'Poppins', sans-serif;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 18px 25px rgba(0,0,0,0.35);
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <div class="navbar">
        <h1>ETU003521</h1>
        <div>
            <a href="/candidat">Candidats</a>
            <a href="/matiere">Matières</a>
            <a href="/notefinale/form">Notes Finale</a>
        </div>
    </div>

    

    <!-- Cards -->
    <div class="card-container">
        <a class="card" href="/candidat">Gestion des Candidats</a>
        <a class="card" href="/matiere">Gestion des Matières</a>
        <a class="card" href="/notefinale/form">Gestion des Notes Finale</a>
    </div>

</body>

</html>