<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="org.bson.BSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!doctype html>

<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Tracking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="images/logo_small_icon_only_inverted.png">
    <link rel="shortcut icon" href="images/logo_small_icon_only.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />

   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

    </style>

</head>

<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="Home"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>

                    <li class="menu-title">Data</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Activities</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="StartActivity">Course</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home"><img src="images/logo.png"@ alt="Logo"></a>
					<a class="navbar-brand hidden" href="./"><img src="images/logo_small_icon_only_inverted.png"@ alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="Logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Joggin</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=nb1%></div>

                                    </div>

                                    <div class="col-auto">
                                        <svg class="svg-inline--fa fa-person-running fa-2x text-gray-300"
                                             aria-hidden="true" focusable="false" data-prefix="fas"
                                             data-icon="person-running" role="img" xmlns="http://www.w3.org/2000/svg"
                                             viewBox="0 0 448 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M400 224h-44l-26.12-53.25c-12.5-25.5-35.38-44.25-61.75-51L197 98.63C189.5 96.84 181.1 95.97 174.5 95.97c-20.88 0-41.33 6.81-58.26 19.78L76.5 146.3C68.31 152.5 64.01 162 64.01 171.6c0 17.11 13.67 32.02 32.02 32.02c6.808 0 13.67-2.158 19.47-6.616l39.63-30.38c5.92-4.488 13.01-6.787 19.53-6.787c2.017 0 3.981 .2196 5.841 .6623l14.62 4.25l-37.5 87.5C154.1 260.3 152.5 268.8 152.5 277.2c0 22.09 11.49 43.52 31.51 55.29l85 50.13l-27.5 87.75c-.9875 3.174-1.458 6.388-1.458 9.55c0 13.65 8.757 26.31 22.46 30.58C265.6 511.5 268.9 512 272 512c13.62 0 26.25-8.75 30.5-22.5l31.75-101c1.211-4.278 1.796-8.625 1.796-12.93c0-16.57-8.661-32.51-23.55-41.44l-61.13-36.12l31.25-78.38l20.25 41.5C310.9 277.4 327.9 288 345.1 288H400c17.62 0 32-14.38 32-32C432 238.3 417.6 224 400 224zM288 96c26.5 0 48-21.5 48-48s-21.5-48-48-48s-48 21.5-48 48S261.5 96 288 96zM129.8 317.5L114.9 352H48c-17.62 0-32 14.38-32 32s14.38 32 32 32h77.5c19.25 0 36.5-11.5 44-29.12l8.875-20.5l-10.75-6.25C150.4 349.9 137.6 334.8 129.8 317.5z">
                                            </path>
                                        </svg>
                                        <!-- <i class="fas fa-person-running fa-2x text-gray-300"></i> Font Awesome fontawesome.com -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Cyclisme</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=nb2%></div>

                                    </div>

                                    <div class="col-auto">
                                        <svg class="svg-inline--fa fa-bicycle fa-2x text-gray-300"
                                             aria-hidden="true" focusable="false" data-prefix="fas"
                                             data-icon="bicycle" role="img" xmlns="http://www.w3.org/2000/svg"
                                             viewBox="0 0 640 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M347.2 32C358.1 32 369.8 38.44 375.4 48.78L473.3 229.1C485.5 226.1 498.5 224 512 224C582.7 224 640 281.3 640 352C640 422.7 582.7 480 512 480C441.3 480 384 422.7 384 352C384 311.1 402.4 276.3 431.1 252.8L409.4 212.7L324.7 356.2C320.3 363.5 312.5 368 304 368H255C247.1 431.1 193.3 480 128 480C57.31 480 0 422.7 0 352C0 281.3 57.31 224 128 224C138.7 224 149.2 225.3 159.2 227.8L185.8 174.7L163.7 144H120C106.7 144 96 133.3 96 120C96 106.7 106.7 96 120 96H176C183.7 96 190.1 99.71 195.5 105.1L222.9 144H372.3L337.7 80H311.1C298.7 80 287.1 69.25 287.1 56C287.1 42.75 298.7 32 311.1 32H347.2zM440 352C440 391.8 472.2 424 512 424C551.8 424 584 391.8 584 352C584 312.2 551.8 280 512 280C508.2 280 504.5 280.3 500.8 280.9L533.1 340.6C539.4 352.2 535.1 366.8 523.4 373.1C511.8 379.4 497.2 375.1 490.9 363.4L458.6 303.7C447 316.5 440 333.4 440 352V352zM108.8 328.6L133.1 280.2C131.4 280.1 129.7 280 127.1 280C88.24 280 55.1 312.2 55.1 352C55.1 391.8 88.24 424 127.1 424C162.3 424 190.9 400.1 198.2 368H133.2C112.1 368 99.81 346.7 108.8 328.6H108.8zM290.3 320L290.4 319.9L217.5 218.7L166.8 320H290.3zM257.4 192L317 274.8L365.9 192H257.4z">
                                            </path>
                                        </svg>
                                        <!-- <i class="fas fa-bicycle fa-2x text-gray-300"></i> Font Awesome fontawesome.com -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Ski</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=nb3%></div>

                                    </div>
                                    <div class="col-auto">
                                        <svg class="svg-inline--fa fa-person-snowboarding fa-2x text-gray-300"
                                             aria-hidden="true" focusable="false" data-prefix="fas"
                                             data-icon="person-snowboarding" role="img"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                             data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M460.7 249.6c5.877 4.25 12.47 6.393 19.22 6.393c10.76 0 32.05-8.404 32.05-31.97c0-9.74-4.422-19.36-12.8-25.65l-111.5-83.48c-13.75-10.25-29.04-18.42-45.42-23.79l-63.66-21.23l-26.12-52.12c-5.589-11.17-16.9-17.64-28.63-17.64c-17.8 0-31.99 14.47-31.99 32.01c0 4.803 1.086 9.674 3.374 14.25l29.12 58.12c5.75 11.38 15.55 19.85 27.67 23.98l16.45 5.522L227.3 154.6C205.5 165.5 191.9 187.4 191.9 211.8L191.9 264.9L117.8 289.6C104.4 294.1 95.95 306.5 95.95 319.9c0 12.05 6.004 19.05 10.33 23.09l-38.68-14.14C41.23 319.4 49.11 295 23.97 295c-18.67 0-23.97 17.16-23.97 24.09c0 8.553 13.68 41.32 51.13 54.88l364.1 132.8C425.7 510.2 435.7 512 445.7 512c12.5 0 24.97-2.732 36.47-8.232c8.723-3.997 13.85-12.71 13.85-21.77c0-18.67-17.15-23.96-24.06-23.96c-3.375 0-6.73 .7505-9.998 2.248c-5.111 2.486-10.64 3.702-16.21 3.702c-4.511 0-9.049-.7978-13.41-2.364l-90.68-33.12c8.625-4.125 15.53-11.76 17.78-21.89l21.88-101.1c.7086-3.335 1.05-6.668 1.05-10c0-14.91-6.906-29.31-19.17-38.4l-52.01-39l66.01-30.5L460.7 249.6zM316.3 301.3l-19.66 92c-.4205 1.997-.5923 3.976-.5923 5.911c0 4.968 1.264 9.691 3.333 14.01l-169.5-61.49c2.625-.25 5.492-.4448 8.117-1.32l85-28.38c19.63-6.5 32.77-24.73 32.77-45.48l0-20.53L316.3 301.3zM431.9 95.99c26.5 0 48-21.5 48-47.1S458.4 0 431.9 0s-48 21.5-48 47.1S405.4 95.99 431.9 95.99z">
                                            </path>
                                        </svg>
                                        <!-- <i class="fas fa-person-snowboarding fa-2x text-gray-300"></i> Font Awesome fontawesome.com -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Marche</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= nb4 %></div>

                                    </div>

                                    <div class="col-auto">
                                        <svg class="svg-inline--fa fa-person-walking fa-2x text-gray-300"
                                             aria-hidden="true" focusable="false" data-prefix="fas"
                                             data-icon="person-walking" role="img" xmlns="http://www.w3.org/2000/svg"
                                             viewBox="0 0 320 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M256 48C256 74.51 234.5 96 208 96C181.5 96 160 74.51 160 48C160 21.49 181.5 0 208 0C234.5 0 256 21.49 256 48zM126.5 199.3C125.6 199.7 124.6 200.1 123.7 200.5L112.7 205.4C97.41 212.2 85.42 224.6 79.22 240.1L77.71 243.9C71.15 260.3 52.53 268.3 36.12 261.7C19.71 255.1 11.73 236.5 18.29 220.1L19.8 216.3C32.19 185.4 56.18 160.5 86.66 146.9L97.66 142C118.5 132.8 140.1 128 163.7 128C208.3 128 248.5 154.8 265.6 195.9L280.1 232.7L302.3 243.4C318.1 251.3 324.5 270.5 316.6 286.3C308.7 302.1 289.5 308.5 273.7 300.6L247 287.3C236.7 282.1 228.6 273.4 224.2 262.8L214.6 239.8L195.3 305.3L244.8 359.4C250.2 365.3 254.1 372.4 256 380.2L279 472.2C283.3 489.4 272.9 506.8 255.8 511C238.6 515.3 221.2 504.9 216.1 487.8L194.9 399.6L124.3 322.5C109.5 306.4 103.1 283.9 109.6 262.8L126.5 199.3zM68.73 398L93.69 335.6C95.84 338.6 98.16 341.4 100.7 344.2L141.4 388.6L126.9 424.8C124.5 430.9 120.9 436.4 116.3 440.9L54.63 502.6C42.13 515.1 21.87 515.1 9.372 502.6C-3.124 490.1-3.124 469.9 9.372 457.4L68.73 398z">
                                            </path>
                                        </svg>
                                        <!-- <i class="fas fa-person-walking fa-2x text-gray-300"></i> Font Awesome fontawesome.com -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="m-0 font-weight-bold text-primary">Stastiques </h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="card-body">
                                        <!-- <canvas id="TrafficChart"></canvas>   -->
                                        <div id="traffic-chart" class="traffic-chart"></div>
                                    </div>
                                </div>
                                <% total = nb1+nb2+nb3+nb4; 
                                    if(total!=0){
                                        nb1p= nb1*100/total;
                                        nb2p= nb2*100/total;
                                        nb3p= nb3*100/total;
                                        nb4p= nb4*100/total;

                                    }
                                
                                %>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="progress-box progress-1">
                                            <h4 class="m-0 font-weight-bold text-primary">Jogging</h4>
                                            <div class="por-txt"><%= nb1p %>%</div>
                                            <div class="progress mb-4" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-1" role="progressbar" style="width:<%= nb1p %>%;"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-2">
                                            <h4 class="m-0 font-weight-bold text-primary">Cyclisme</h4>
                                            <div class="por-txt"> <%= nb2p %>%</div>
                                            <div class="progress mb-4" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-2" role="progressbar" style="width: <%= nb2p %>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-3">
                                            <h4 class="m-0 font-weight-bold text-primary">Ski</h4>
                                            <div class="por-txt"><%= nb3p %>%</div>
                                            <div class="progress mb-4" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-3" role="progressbar" style="width: <%= nb3p %>%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-4">
                                            <h4 class="m-0 font-weight-bold text-primary">Marche</h4>
                                            <div class="por-txt"><%= nb4p %>%</div>
                                            <div class="progress mb-4" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-4" role="progressbar" style="width: <%= nb4p %>%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div> <!-- /.card-body -->
                                </div>
                            </div> <!-- /.row -->
                            <div class="card-body"></div>
                        </div>
                    </div><!-- /# column -->
                </div>
                <!--  /Traffic -->
                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="row">

                        <div class="card mb-4">
                            <div class="card-header">
                                <!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                                List des Activités
                            </div>
                            <div class="card-body--">

                                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">

                                    <div class="dataTable-top">

                                    </div>
                                    <div class="dataTable-container">
                                        <table class="dataTable-table">
                                            <thead>
                                            <tr>
                                                <th data-sortable="" style="width: 19.7947%;"><a href="#" class="dataTable-sorter">Name</a></th>
                                                <th data-sortable="" style="width: 29.1789%;"><a href="#" class="dataTable-sorter">Date de debut</a></th>
                                                <th data-sortable="" style="width: 15.3959%;"><a href="#" class="dataTable-sorter">Date de fin</a></th>
                                                <th data-sortable="" style="width: 8.94428%;"><a href="#" class="dataTable-sorter">Durée</a></th>
                                                <th data-sortable="" style="width: 15.2493%;"><a href="#" class="dataTable-sorter">View</a></th>
                                                <th data-sortable="" style="width: 11.437%;"><a href="#" class="dataTable-sorter">Delete</a></th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%! String categorie1="jogging"; %>
                                            <%! String categorie2="cyclisme"; %>
                                            <%! String categorie3="ski"; %>
                                            <%! String categorie4="marche"; %>
                                            <%! String categorie=" "; %>
                                            <%! String jour=" "; %>
                                            <%! int nb1=0; %>
                                            <%! int nb2=0; %>
                                            <%! int nb3=0; %>
                                            <%! int nb4=0; %>
                                            <%! String jour1="Mon"; %>
                                            <%! String jour2="Tue"; %>
                                            <%! String jour3="Wed"; %>
                                            <%! String jour4="thu"; %>
                                            <%! String jour5="Fri"; %>
                                            <%! String jour6="Sat"; %>
                                            <%! String jour7="Sun"; %>
                                            <%! int j1=0; %>
                                            <%! int j2=0; %>
                                            <%! int j3=0; %>
                                            <%! int j4=0; %>
                                            <%! int j5=0; %>
                                            <%! int j6=0; %>
                                            <%! int j7=0; %>
                                            <%! int j8=0; %>
                                            <%! int j9=0; %>
                                            <%! int j10=0; %>
                                            <%! int j11=0; %>
                                            <%! int j12=0; %>
                                            <%! int j13=0; %>
                                            <%! int j14=0; %>
                                            <%! int j15=0; %>
                                            <%! int j16=0; %>
                                            <%! int j17=0; %>
                                            <%! int j18=0; %>
                                            <%! int j19=0; %>
                                            <%! int j20=0; %>
                                            <%! int j21=0; %>
                                            <%! int j22=0; %>
                                            <%! int j23=0; %>
                                            <%! int j24=0; %>
                                            <%! int j25=0; %>
                                            <%! int j26=0; %>
                                            <%! int j27=0; %>
                                            <%! int j28=0; %>
                                            <%! int total=0; %>
                                            <%! float nb1p=0; %>
                                            <%! float nb2p=0; %>
                                            <%! float nb3p=0; %>
                                            <%! float nb4p=0; %>


                                            <%

                                                List<DBObject> attribut = (List<DBObject>)request.getAttribute("activities");

                                                nb1=0;
                                                nb2=0;
                                                nb3=0;
                                                nb4=0;
                                                j1=0;
                                                j2=0;
                                                j3=0;
                                                j4=0;
                                                j5=0;
                                                j6=0;
                                                j7=0;
                                                j8=0;
                                                j9=0;
                                                j10=0;
                                                j11=0;
                                                j12=0;
                                                j13=0;
                                                j14=0;
                                                j15=0;
                                                j16=0;
                                                j17=0;
                                                j18=0;
                                                j19=0;
                                                j20=0;
                                                j21=0;
                                                j22=0;
                                                j23=0;
                                                j24=0;
                                                j25=0;
                                                j26=0;
                                                j27=0;
                                                j28=0;


                                                for( DBObject att : attribut   )
                                                {
                                                    categorie= (String) att.get("nomactivite");
                                                    java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( "EE" );
                                                    jour= formater.format(att.get("datedebut"));

                                                    if(categorie.equals(categorie1) && jour.equals(jour1)){
                                                        j1++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour2)){
                                                        j2++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour3)){
                                                        j3++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour4)){
                                                        j4++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour5)){
                                                        j5++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour6)){
                                                        j6++;
                                                    }else if(categorie.equals(categorie1) && jour.equals(jour7)){
                                                        j7++;
                                                    }

                                                    if(categorie.equals(categorie2) && jour.equals(jour1)){
                                                        j8++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour2)){
                                                        j9++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour3)){
                                                        j10++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour4)){
                                                        j11++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour5)){
                                                        j12++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour6)){
                                                        j13++;
                                                    }else if(categorie.equals(categorie2) && jour.equals(jour7)){
                                                        j14++;
                                                    }

                                                    if(categorie.equals(categorie3) && jour.equals(jour1)){
                                                        j15++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour2)){
                                                        j16++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour3)){
                                                        j17++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour4)){
                                                        j18++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour5)){
                                                        j19++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour6)){
                                                        j20++;
                                                    }else if(categorie.equals(categorie3) && jour.equals(jour7)){
                                                        j21++;
                                                    }

                                                    if(categorie.equals(categorie4) && jour.equals(jour1)){
                                                        j22++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour2)){
                                                        j23++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour3)){
                                                        j24++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour4)){
                                                        j25++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour5)){
                                                        j26++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour6)){
                                                        j27++;
                                                    }else if(categorie.equals(categorie4) && jour.equals(jour7)){
                                                        j28++;
                                                    }

                                                    if(categorie.equals(categorie1)){
                                                        nb1++;
                                                    }else if(categorie.equals(categorie2)){
                                                        nb2++;
                                                    }else if(categorie.equals(categorie3)){
                                                        nb3++;
                                                    }else if(categorie.equals(categorie4)){
                                                        nb4++;
                                                    }
                                            %>
                                            <tr>
                                                <td>  <span class="name"><%=att.get("nomactivite")%></span></td>
                                                <td> <span class="name"><%=att.get("datedebut")%></span> </td>
                                                <td><span class="name"><%=att.get("datefin")%></span></td>
                                                <td><span class="name"><%=att.get("nbrminutes")%></span></td>

                                                <td>
                                                    <a href='Details?id=<%=att.get("_id")%>'>View</a>
                                                </td>
                                                <td>
                                                    <a href='Delete?id=<%=att.get("_id")%>'>delete</a>

                                                    <!--<span class="badge badge-success"><a href="Details?id=<%=att.get("_id")%></a>">View</a></span>-->
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div>
                        </div> <!-- /.card -->
                        <!-- /.col-lg-8 -->

                        <!-- /.col-md-4 -->
                    </div>
                </div>
                <!-- /.orders -->
                <!-- Calender Chart Weather  -->
                <div class="row">
                    <div class="col-md-12 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <!-- <h4 class="box-title">Chandler</h4> -->
                                <div class="calender-cont widget-calender">
                                    <div id="calendar"></div>
                                </div>
                            </div>
                        </div><!-- /.card -->
                    </div>

                    <div class="col-xl-4">
                        <div class="row">

                            <div class="col-lg-6 col-xl-12">
                                <div class="card bg-flat-color-3  ">
                                    <div class="card-body">
                                        <h4 class="card-title m-0  white-color ">June 2021</h4>
                                    </div>
                                    <div class="card-body">
                                        <div id="flotLine5" class="flot-line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Calender Chart Weather -->
                <!-- Modal - Calendar - Add New Event -->
                <div class="modal fade none-border" id="event-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add New Event</strong></h4>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#event-modal -->
                <!-- Modal - Calendar - Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add a category </strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="pink">Pink</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2021 Your Running App
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>

    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
    <script src="assets/js/init/weather-init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script src="assets/js/init/fullcalendar-init.js"></script>

    <!--Local Stuff-->
    <script>
        jQuery(document).ready(function($) {
            "use strict";

            // Line Chart  #flotLine5
            var newCust = [[0, 3], [1, 5], [2,4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

            var plot = $.plot($('#flotLine5'),[{
                data: newCust,
                label: 'New Data Flow',
                color: '#fff'
            }],
            {
                series: {
                    lines: {
                        show: true,
                        lineColor: '#fff',
                        lineWidth: 2
                    },
                    points: {
                        show: true,
                        fill: true,
                        fillColor: "#ffffff",
                        symbol: "circle",
                        radius: 3
                    },
                    shadowSize: 0
                },
                points: {
                    show: true,
                },
                legend: {
                    show: false
                },
                grid: {
                    show: false
                }
            });
            // Line Chart  #flotLine5 End
            // Traffic Chart using chartist
            if ($('#traffic-chart').length) {

            }
            // Traffic Chart using chartist End
            //Traffic chart chart-js
            //Traffic chart chart-js  End
            
        });
    </script>
</body>
</html>

