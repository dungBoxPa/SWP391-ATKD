<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="/ATKD_Project/homepage/parent/css/childregister.css">
    </head>

    <body>
        <div class="wrapper">
            <div class="home">
                <div class="left-side-menu">
                    <div class="vertical-menu" style="position: relative;">
                        <div class="user-welcome">
                            <img class="user-img" src="/ATKD_Project/homepage/parent/img/userImg/dummy-user-img.png" style="width: 80px; height: 80px;" alt="">
                            <p>${sessionScope.account.firstName} ${sessionScope.account.lastName}</p>
                        </div>
                        <div class="menu-item-container">
                            <ul class="item-lists">
                                <li class="menu-item ">
                                    <a href="/ATKD_Project/homepage/childdetailservlet">Child Information</a>
                                </li>
                                <li class="menu-item current1">
                                    <a href="/ATKD_Project/homepage/parent/parentprofile.jsp">Parent Information</a>
                                </li>
                                <li class="menu-item">
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

                <div class="right-side">
                    <div class="page-content">
                        <div class="kid-profile">
                            <div class="kid-profile_header">
                                
                                <div class="img-section">
                                    <img src="/ATKD_Project/homepage/parent/img/userImg/dummy-user-img.png" alt="">
                                </div>

                                <div class="personel-section">
                                    <h1>${sessionScope.account.firstName} ${sessionScope.account.lastName}</h1>
                                    <p>${sessionScope.account.dob}</p>
                                </div>
                            </div>

                            
                        <form action="/ATKD_Project/homepage/parentupdate" method="POST">      
                            <div class="kid-profile_content">
                                <div class="class content-item">
                                    <div class="item-title">
                                        <strong>First Name</strong>
                                        
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="text" class="class content-item" name="parentfirstname" value="${account.firstName}">
                                    
                                </div>
                                <div class="content-item phone">
                                    <div class="item-title">
                                        <strong>Last name</strong>
                                        
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="text" class="class content-item" name="parentlastname" value="${account.lastName}">
                                    
                                    
                                </div>
                                <div class="content-item">
                                    
                                    <div class="item-title">
                                        <strong>Date of birth</strong>
                                    </div>
                                    
                                    <c:set var="parent" value="${requestScope.dob}"/>
                                    <input type="date"  class="class content-item" style="width: 400;" name="parentdob" value="${account.dob}">
                                   
                                    
                                </div>
                                <div class="content-item">
                                    <div class="item-title">
                                        <strong>Gender</strong>
                                    </div>
                                    <select style="width:570px; " class="class content-item" name ="parentgender" id="parentgender" value="
                                    <c:if test="${account.gender == true }">
                                        <h1>Male</h1>
                                    </c:if>
                                    <c:if test="${account.gender == false }">
                                        <h1>Female</h1>
                                    </c:if>"
                                    >
                                    <optgroup>
                                        <option value="male"><h1>Male</h1></option>
                                        <option value="female"><h1>Female</h1></option>
                                    </optgroup>
                                    </select>    
                                    </div>    
                                <div class="content-item address">
                                    <div class="item-title">
                                        <strong>Phone</strong>
                                         
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="number" class="class content-item" name="parentphonenumber" value="${account.phoneNumber}">
                                    
                                    
                                </div>
                                <div class="content-item description">
                                    <div class="item-title">
                                        <strong>Address</strong>
                                        
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="text" class="class content-item" name="parentaddress" value="${account.address}">
                                    
                                    
                                </div>
                                <div class="content-item address">
                                    <div class="item-title">
                                        <strong>Email</strong>
                                        
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="text" class="class content-item" name="parentemail" value="${account.email}" readonly="">
                                    
                                    
<!--                                </div>
                                <div class="content-item address">
                                    <div class="item-title">
                                        <strong>Child name</strong>
                                    </div>
                                    <p>${mainchild.first_name} ${mainchild.last_name}</p>
                                    
                                --></div>
                                    <div class="content-item description">
                                    <div class="item-title">
                                        <strong>Avatar</strong>
                                        
                                    </div>
                                    <c:set var="parent" value="${requestScope.account}"/>
                                    <input type="text" class="class content-item" name="parentavatar" value="${account.img}">
                                    
                                    
                                </div>
                                <div class="mb-6" style="margin-top: 30px; margin-bottom: 30px; padding-left: 250px ">
                                    
                                        <input type="button" class="cancel_button" onclick="window.location.replace('/ATKD_Project/homepage/parent/parentprofile.jsp')" value="Cancel"/>
                                        <input style="margin-left: 30px;"  type="submit" class="confirm_button" value="Confirm Update"/>
                                    
                                </div>
                                
                            </div>
                        </form>            
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
    <script>
        window.onload = function () {
            var patharr = location.pathname.split("/");
            var fileName = patharr[3];
            var options = document.getElementById('options');
            var links = options.getElementsByTagName("a");
            // alert(links.length);
            for (i = 1; i < links.length; i++) {
                if (links[i].getAttribute("href").indexOf(fileName) > -1) {
                    links[i].parentNode.className = 'current';
                }
            }
        };
    </script>

</html>

