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
        <!-- listar por nombre-->
       <li> <form action="order-person" method="post" class="d-inline">
            <button type="submit" >
                <i class="fa-solid fa-trash"></i> Por Nombre
            </button>
        </form>
        </li>
<!-- listar por id-->
        <li> <form action="list-person" method="post" class="d-inline">
            <button type="submit" >
                <i class="fa-solid fa-trash"></i> Asecendente
            </button>
        </form>
        </li>

       <li> <form action="order-person-desc" method="post" class="d-inline">
            <button type="submit">
                <i class="fa-solid fa-trash"></i> Desendente
            </button>
        </form>
       </li>

    </div>
    <!--
    <div class="search-icon">
        <span class="fas fa-search"></span>
    </div>
    <div class="cancel-icon">
        <span class="fas fa-times"></span>
    </div>

    <form action="search-person" method="post">
        <input type="search" class="search-data" placeholder="Search" required>
        <button type="submit" class="fas fa-search"></button>
    </form>
    -->
</nav>
<div class="row justify-content-center mb-2">
    <div class="col-10">
        <div class="row justify-content-end">
            <div class="col-10">

                <c:if test="${param['result-save']}">

                <c:if test="${param['result-save']=='ok'}">
                bien
            </div>
            </c:if>
            <c:if test="${param['result-save']=='error'}">
            mal
        </div>
        </c:if>
        </c:if>
    </div>

    <div class="row justify-content-center">
        <div class="col-10">
            <table class="table table-hover table-bordered table-striped">
                <thead>
                <tr>

                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>Acciones</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="person">
                    <tr>

                        <td> <c:out value="${person.name}" /></td>
                        <td> <c:out value="${person.lastName}" /></td>
                        <td> <c:out value="${person.email}" /></td>
                        <td> <c:out value="${person.phone}" /></td>
                        <td> <c:out value="${person.address}" /></td>

                        <td>

                            <div class="row justify-content-center">
                                <div class="col-6">
                                    <a href="get-person?id=${person.id}"  class="btn btn-info">
                                        <i class="fa-solid fa-magnifying-glass"></i> Cosultar
                                    </a>
                                </div>

                                <div class="col-6">
                                    <form action="delete-person" method="post" class="d-inline">

                                        <input type="hidden" name="id" value="${person.id}">

                                        <button type="submit" class="btn btn-danger mt-2">
                                            <i class="fa-solid fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </div>

                            </div>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>


            </table>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">

    const menuBtn = document.querySelector(".menu-icon span");
    const searchBtn = document.querySelector(".search-icon");
    const cancelBtn = document.querySelector(".cancel-icon");
    const items = document.querySelector(".nav-items");
    const form = document.querySelector("form");
    menuBtn.onclick = ()=>{
        items.classList.add("active");
        menuBtn.classList.add("hide");
        searchBtn.classList.add("hide");
        cancelBtn.classList.add("show");
    }
    cancelBtn.onclick = ()=>{
        items.classList.remove("active");
        menuBtn.classList.remove("hide");
        searchBtn.classList.remove("hide");
        cancelBtn.classList.remove("show");
        form.classList.remove("active");
        cancelBtn.style.color = "#ff3d00";
    }
    searchBtn.onclick = ()=>{
        form.classList.add("active");
        searchBtn.classList.add("hide");
        cancelBtn.classList.add("show");
    }

    var table = document.getElementById("table");
    var orderByName = document.getElementById("orderByName");
    orderByName.addEventListener("click", function(){
        var tbody = table.querySelector("tbody");
        var rowsArray = Array.prototype.slice.call(tbody.querySelectorAll("tr"));
        var sortedRows = rowsArray.sort(function(rowA, rowB){
            var nameA = rowA.querySelector(".name").textContent;
            var nameB = rowB.querySelector(".name").textContent;
            if(nameA < nameB) return -1;
            if(nameA > nameB) return 1;
            return 0;
        });
        sortedRows.forEach(function(row){
            tbody.appendChild(row);
        });
    });
    </script>
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
        width: auto;
        height: 100%;
        background: none;
        border: none;
        color: #fff;
        font-size: 17px;
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
    button{
        style: none;
    }

</style>
</html>
