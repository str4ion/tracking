<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inscription</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link type="text/css" rel="stylesheet" href="css/sourcesanspro-font.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link type="text/css" rel="stylesheet" href="css/style.css" />
    </head>
        <body class="form-v8">
            <div class="page-content">
                <div class="form-v8-content">
                    <div class="form-left">
                        <img src="images/body4.png"@ alt="form">
                    </div>
                    <div class="form-right">
                        <div class="tab">
                            <div class="tab-inner">
                                <button class="tablinks" onclick="window.location.assign('Register');">Sign Up</button>
                            </div>
                            <div class="tab-inner">
                                <button class="tablinks" onclick="window.location.assign('Login');">Sign In</button>
                            </div>
                        </div>
                        <form class="form-detail" method="post" action="Login">
                            <div class="tabcontent" id="sign-up">
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="text" name="login" id="login" class="input-text" required>
                                        <span class="label">E-Mail</span>
                                          <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="password" id="password" name="password" class="input-text" required>
                                        <span class="label">Password</span>
                                        <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row-last">
                                    <input type="submit" name="login" class="register" value="Login">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </body>
        </html>

