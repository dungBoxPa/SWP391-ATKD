<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="./assets/image/logo2-removebg-preview.png">
        <title>ATKD ChildCare</title>
        <link rel="stylesheet" href="/ATKD_Project/homepage/parent/css/parenthome.css">
        <link rel="stylesheet" href="/ATKD_Project/homepage/parent/css/childprofile.css">
        <script src="https://kit.fontawesome.com/67b5c45612.js" crossorigin="anonymous"></script>
        <script src="js/childdetails.js"></script>
        <link rel="stylesheet" href="/ATKD_Project/homepage/parent/css/childdetails.css">
        <link rel="stylesheet" href="/ATKD_Project/homepage/parent/css/childregister.css">
        <style>

        </style>
    </head>

    <body>
        <!-- Link to Add child to database -->
        
            <div class="wrapper">
                <div class="home">
                    <div class="left-side-menu">
                        <div class="vertical-menu">
                            <div class="user-welcome">
                                <img class="user-img" src="/ATKD_Project/homepage/parent/img/userImg/dummy-user-img.png" style="width: 80px; height: 80px;" alt="">
                                <p>${sessionScope.account.firstName} ${sessionScope.account.lastName}</p>
                            </div>
                            <div class="menu-item-container">
                                <ul class="item-lists">
                                    <li class="menu-item">
                                        <a href="/ATKD_Project/homepage/childdetailservlet">Child Information</a>
                                    </li>
                                    <li class="menu-item">
                                        <a href="/ATKD_Project/homepage/parent/parentprofile.jsp">Parent Information</a>
                                    </li>
                                    <li class="menu-item  current1">
                                        <a href="/ATKD_Project/homepage/parent/childregister.jsp">Child Register</a>
                                    </li>
                                </ul>
                            </div>
                           <div style="border-top: 3px solid gray;"></div>
                        <div style="position: absolute;margin-top: 1vh; margin-left: 40px">
                            <input type="button" class="log-out_button" onclick="window.location.replace('/ATKD_Project/homepage/logout')" value="Log out"/>
                        </div>
                        </div>
                    </div>
                            <!-- Form add -->
            <form action="/ATKD_Project/homepage/childregister" method="POST">
                    <div class="right-side">
                        <div class="page-content">
                            <div class="kid-register">
                                <div class="kid-register_content">
                                    <div class="kindergartner-register">Kindergartner Register</div>
                                    <div style="width: 80%;height: auto; margin-left: 10%; padding-top: 0;padding-bottom: 0;">
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="item-title">
                                                    <strong>Child first name</strong>
                                                </div>
                                                <label for="exampleFormControlInput1" class="form-label"></label>
                                                <input type="text" class="class content-item" id="exampleFormControlInput1" name="ChildFirstName" required="">
<!--                                                <i class="fas fa-check-circle"></i>
                                                <i class="fas fa-exclamation-circle"></i>
                                                <small>Error message</small>-->
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="item-title">
                                                    <strong>Child last name</strong>
                                                </div>
                                                <label for="exampleFormControlInput1" class="form-label"></label>
                                                <input type="text" class="class content-item" id="exampleFormControlInput1" name="ChildLastName" required="">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="item-title">
                                                    <strong>DOB</strong>
                                                </div>
                                                <label for="exampleFormControlInput1" class="form-label"></label>
                                                <input type="date" class="class content-item" id="exampleFormControlInput1" name="DOB" required="">     
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="gender">
                                                    <strong>Gender</strong>
                                                </div>

                                                <div class="rdCheck" style="display: flex;padding-left: 30px">

                                                    <div class="form-check">
                                                        <div class="img-gender" >
                                                            <img src="/ATKD_Project/homepage/parent/img/userImg/images.jpg" alt="">
                                                            <p style="padding-top: 10px;padding-left: 10px;padding-right: 10px">
                                                                Male
                                                            </p>
                                                            <input class="form-check-input" type="radio" value="male" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-check" style="padding-left: 80px">
                                                    <div class="img-gender">
                                                        <img src="/ATKD_Project/homepage/parent/img/userImg/download.png" alt="">
                                                        <p style="padding-top: 10px;padding-left: 10px;padding-right: 10px">
                                                            Female
                                                        </p>
                                                        <input class="form-check-input" type="radio" value="female" name="flexRadioDefault" id="flexRadioDefault2">
                                                    </div>
                                                </div>     
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="item-title">
                                                    <strong>Image</strong>
                                                </div>
                                                <label for="exampleFormControlInput1" class="form-label"></label>
                                                <input type="text" class="class content-item" id="exampleFormControlInput1" name="ChildImg" required="">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="content-item">
                                                <div class="item-title">
                                                    <strong>Choose desired class</strong>
                                                </div>
                                                <select name="register_classid" id="register_classid" class="class content-item">
                                                    <c:forEach items="${classlist}" var="c">
                                                        <option value="${c.getClass_id()}">
                                                        <h1>${c.getClass_name()}</h1>
                                                        </option>
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="mb-6" style="margin-top: 30px; margin-bottom: 30px; padding-left: 200px ">
                                            <input type="submit" class="button" value="Confirm"/>

                                        </div>
                                    </div>
                                </div>
                            </div>       
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <!-- <script src="agu.js"></script> -->
    </body>

<script>
    window.onload = function () {
        var patharr = location.pathname.split("/");
        var fileName = patharr[1];
        var options = document.getElementById('options');
        var links = options.getElementsByTagName("a");
        // alert(links.length);
        for (i = 1; i < links.length; i++) {
            if (links[i].getAttribute("href").indexOf(fileName) > -1) {
                links[i].parentNode.className = 'current';
            }
        }
    }
</script>      


</html>

















