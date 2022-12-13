<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agenda</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>


    <a href="list-person" >Agenda</a>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">

</script>
</body>
<style>
    a{
        text-decoration: none;
        color: black;
    }
    a::before {
        transform: scaleX(0);
        transform-origin: bottom right;
    }

    a:hover::before {
        transform: scaleX(1);
        transform-origin: bottom left;
    }
    a::before {
        content: " ";
        display: block;
        position: absolute;
        top: 0; right: 0; bottom: 0; left: 0;
        inset: 0 0 0 0;
        background: hsl(200 100% 80%);
        z-index: -1;
        transition: transform .3s ease;
    }

    a {
        position: relative;
        font-size: 5rem;
    }

    html {
        block-size: 100%;
        inline-size: 100%;
    }

    body {
        min-block-size: 100%;
        min-inline-size: 100%;
        margin: 0;
        box-sizing: border-box;
        display: grid;
        place-content: center;
        font-family: system-ui, sans-serif;
    }

    @media (orientation: landscape) {
        body {
            grid-auto-flow: column;
        }
    }
</style>
</html>
