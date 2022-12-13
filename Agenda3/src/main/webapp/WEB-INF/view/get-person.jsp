<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 06/11/2022
  Time: 08:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar persona</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<nav>
    <div class="menu-icon">
        <span class="fas fa-bars"></span>
    </div>
    <div class="logo">
        Agenda
    </div>
    <div class="nav-items">
        <li> <a href="list-person" >Agenda</a></li>
        <li> <a href="create-person" >Registar <Nuevo></Nuevo></a></li>

    </div>


</nav>
<div class="container mt-3">

    <h1 class="text-center">Modificar usuario</h1>

    <div class="row justify-content-center">
        <div class="col-4">

            <form action="update-person" method="post">
                <input type="hidden" name="id" value="${personX.id}">

                <div class="mb-3">
                    <label for="controlName" class="form-label">Nombre: </label>
                    <input type="text" class="form-control" id="controlName" name="name" value="${personX.name}">
                </div>
                <div class="mb-3">
                    <label for="controllastname" class="form-label">apellido: </label>
                    <input type="text" class="form-control" id="controllastname" name="lastname" value="${personX.lastName}">
                </div>

                <div class="mb-3">
                    <label for="controlEmail" class="form-label">Email: </label>
                    <input type="text" class="form-control" id="controlEmail" name="email" value="${personX.email}">
                </div>
                <div class="mb-3">
                    <label for="controlTel" class="form-label">Telefono: </label>
                    <input type="number" class="form-control" id="controlTel" name="phone" value="${personX.phone}">
                </div>
                <div class="mb-3">
                    <label for="controlAddress" class="form-label">Direccion: </label>
                    <input type="text" class="form-control" id="controlAddress" name="address" value="${personX.address}">
                </div>

                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="reset" class="btn btn-danger">Cancelar</button>
                <a href="list-person" class="btn btn-success">Regresar</a>



            </form>


        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
<style>
    @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap');
    *{
        margin: 0;
        padding: 0;
        outline: none;
        box-sizing: border-box;
        font-family: 'Montserrat', sans-serif;
    }
    body{
        background: #f2f2f2;
    }
    nav{
        background: #171c24;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: space-between;
        height: 70px;
        padding: 0 100px;
    }
    nav .logo{
        color: #fff;
        font-size: 30px;
        font-weight: 600;
        letter-spacing: -1px;
    }
    nav .nav-items{
        display: flex;
        flex: 1;
        padding: 0 0 0 40px;
    }
    nav .nav-items li{
        list-style: none;
        padding: 0 15px;
    }
    nav .nav-items li a{
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        text-decoration: none;
    }
    nav .nav-items li a:hover{
        color: #ff3d00;
    }
    nav form{
        display: flex;
        height: 40px;
        padding: 2px;
        background: #1e232b;
        min-width: 18%!important;
        border-radius: 2px;
        border: 1px solid rgba(155,155,155,0.2);
    }
    nav form .search-data{
        width: 100%;
        height: 100%;
        padding: 0 10px;
        color: #fff;
        font-size: 17px;
        border: none;
        font-weight: 500;
        background: none;
    }
    nav form button{
        padding: 0 15px;
        color: #fff;
        font-size: 17px;
        background: #ff3d00;
        border: none;
        border-radius: 2px;
        cursor: pointer;
    }
    nav form button:hover{
        background: #e63600;
    }
    nav .menu-icon,
    nav .cancel-icon,
    nav .search-icon{
        width: 40px;
        text-align: center;
        margin: 0 50px;
        font-size: 18px;
        color: #fff;
        cursor: pointer;
        display: none;
    }
    nav .menu-icon span,
    nav .cancel-icon,
    nav .search-icon{
        display: none;
    }
    @media (max-width: 1245px) {
        nav{
            padding: 0 50px;
        }
    }
    @media (max-width: 1140px){
        nav{
            padding: 0px;
        }
        nav .logo{
            flex: 2;
            text-align: center;
        }
        nav .nav-items{
            position: fixed;
            z-index: 99;
            top: 70px;
            width: 100%;
            left: -100%;
            height: 100%;
            padding: 10px 50px 0 50px;
            text-align: center;
            background: #14181f;
            display: inline-block;
            transition: left 0.3s ease;
        }
        nav .nav-items.active{
            left: 0px;
        }
        nav .nav-items li{
            line-height: 40px;
            margin: 30px 0;
        }
        nav .nav-items li a{
            font-size: 20px;
        }
        nav form{
            position: absolute;
            top: 80px;
            right: 50px;
            opacity: 0;
            pointer-events: none;
            transition: top 0.3s ease, opacity 0.1s ease;
        }
        nav form.active{
            top: 95px;
            opacity: 1;
            pointer-events: auto;
        }
        nav form:before{
            position: absolute;
            content: "";
            top: -13px;
            right: 0px;
            width: 0;
            height: 0;
            z-index: -1;
            border: 10px solid transparent;
            border-bottom-color: #1e232b;
            margin: -20px 0 0;
        }
        nav form:after{
            position: absolute;
            content: '';
            height: 60px;
            padding: 2px;
            background: #1e232b;
            border-radius: 2px;
            min-width: calc(100% + 20px);
            z-index: -2;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        nav .menu-icon{
            display: block;
        }
        nav .search-icon,
        nav .menu-icon span{
            display: block;
        }
        nav .menu-icon span.hide,
        nav .search-icon.hide{
            display: none;
        }
        nav .cancel-icon.show{
            display: block;
        }
    }
    .content{
        position: absolute;
        top: 50%;
        left: 50%;
        text-align: center;
        transform: translate(-50%, -50%);
    }
    .content header{
        font-size: 30px;
        font-weight: 700;
    }
    .content .text{
        font-size: 30px;
        font-weight: 700;
    }
    .space{
        margin: 10px 0;
    }
    nav .logo.space{
        color: red;
        padding: 0 5px 0 0;
    }
    @media (max-width: 980px){
        nav .menu-icon,
        nav .cancel-icon,
        nav .search-icon{
            margin: 0 20px;
        }
        nav form{
            right: 30px;
        }
    }
    @media (max-width: 350px){
        nav .menu-icon,
        nav .cancel-icon,
        nav .search-icon{
            margin: 0 10px;
            font-size: 16px;
        }
    }
    .content{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .content header{
        font-size: 30px;
        font-weight: 700;
    }
    .content .text{
        font-size: 30px;
        font-weight: 700;
    }
    .content .space{
        margin: 10px 0;
    }

</style>
</html>
