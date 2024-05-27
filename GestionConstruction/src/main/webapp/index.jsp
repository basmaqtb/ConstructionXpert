<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cornerstone</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    
    <style>
        .hero {
            background-image: url("https://cornerstonesteelmt.com/wp-content/uploads/2022/03/cornerstone-home-1-edited-1.jpg");
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
            margin-top: 56px; /* Offset for fixed navbar height */
        }
        .hero-text {
            background: rgba(0, 0, 0, 0.3);
            padding: 20px;
            border-radius: 5px;
        }
        nav a.nav-link {
            color: black !important;
            font-weight: 500;
        }
        .navbar-brand img {
            height: 40px;
        }
        .navbar-light .navbar-toggler {
            border-color: rgba(0, 0, 0, 0.1);
        }
        .navbar-light .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">
            <img src="ziko.png" alt="Cornerstone Steel">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List">Projets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="listTT">Taches</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ressources</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="hero">
        <div class="hero-text">
            <h1>Montana's Go-To Contractor for Steel Buildings</h1>
            <p>BUILT WITH MONTANA PRIDE</p>
            <a href="new" class="btn btn-primary">Ajouter projet</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
