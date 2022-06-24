<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBObject"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/feather/feather.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <script src="assets/js/main.js"></script>
    <!-- endinject -->
    <link rel="shortcut icon" href="images/favicon.png" />
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="js/dataTables.select.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/Chart.roundedBarCharts.js"></script>

</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="images/logo.svg" class="mr-2" alt="logo"></a>
            <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="icon-menu"></span>
            </button>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown">
                    <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                        <i class="icon-bell mx-0"></i>
                        <span class="count"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-success">
                                    <i class="ti-info-alt mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">Application Error</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Just now
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-warning">
                                    <i class="ti-settings mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">Settings</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    Private message
                                </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item">
                            <div class="preview-thumbnail">
                                <div class="preview-icon bg-info">
                                    <i class="ti-user mx-0"></i>
                                </div>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject font-weight-normal">New user registration</h6>
                                <p class="font-weight-light small-text mb-0 text-muted">
                                    2 days ago
                                </p>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                        <img src="images/faces/face28.jpg" alt="profile">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item">
                            <i class="ti-settings text-primary"></i>
                            Settings
                        </a>
                        <a class="dropdown-item">
                            <i class="ti-power-off text-primary"></i>
                            Logout
                        </a>
                    </div>
                </li>
                <li class="nav-item nav-settings d-none d-lg-flex">
                    <a class="nav-link" href="#">
                        <i class="icon-ellipsis"></i>
                    </a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_settings-panel.html -->
        <div id="right-sidebar" class="settings-panel">
            <i class="settings-close ti-close"></i>
            <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
                </li>
            </ul>
            <div class="tab-content" id="setting-content">
                <div class="tab-pane fade show active scroll-wrapper ps ps--active-y" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                    <div class="add-items d-flex px-3 mb-0">
                        <form class="form w-100">
                            <div class="form-group d-flex">
                                <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                                <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                            </div>
                        </form>
                    </div>
                    <div class="list-wrapper px-3">
                        <ul class="d-flex flex-column-reverse todo-list">
                            <li>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="checkbox" type="checkbox">
                                        Team review meeting at 3.00 PM
                                        <i class="input-helper"></i></label>
                                </div>
                                <i class="remove ti-close"></i>
                            </li>
                            <li>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="checkbox" type="checkbox">
                                        Prepare for presentation
                                        <i class="input-helper"></i></label>
                                </div>
                                <i class="remove ti-close"></i>
                            </li>
                            <li>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="checkbox" type="checkbox">
                                        Resolve all the low priority tickets due today
                                        <i class="input-helper"></i></label>
                                </div>
                                <i class="remove ti-close"></i>
                            </li>
                            <li class="completed">
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="checkbox" type="checkbox" checked="">
                                        Schedule meeting for next week
                                        <i class="input-helper"></i></label>
                                </div>
                                <i class="remove ti-close"></i>
                            </li>
                            <li class="completed">
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="checkbox" type="checkbox" checked="">
                                        Project review
                                        <i class="input-helper"></i></label>
                                </div>
                                <i class="remove ti-close"></i>
                            </li>
                        </ul>
                    </div>
                    <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
                    <div class="events pt-4 px-3">
                        <div class="wrapper d-flex mb-2">
                            <i class="ti-control-record text-primary mr-2"></i>
                            <span>Feb 11 2018</span>
                        </div>
                        <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
                        <p class="text-gray mb-0">The total number of sessions</p>
                    </div>
                    <div class="events pt-4 px-3">
                        <div class="wrapper d-flex mb-2">
                            <i class="ti-control-record text-primary mr-2"></i>
                            <span>Feb 7 2018</span>
                        </div>
                        <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
                        <p class="text-gray mb-0 ">Call Sarah Graves</p>
                    </div>
                    <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                        <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                    </div>
                    <div class="ps__rail-y" style="top: 0px; height: 671px; right: 0px;">
                        <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 506px;"></div>
                    </div>
                </div>
                <!-- To do section tab ends -->
                <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
                    <div class="d-flex align-items-center justify-content-between border-bottom">
                        <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
                        <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
                    </div>
                    <ul class="chat-list">
                        <li class="list active">
                            <div class="profile"><img src="images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                            <div class="info">
                                <p>Thomas Douglas</p>
                                <p>Available</p>
                            </div>
                            <small class="text-muted my-auto">19 min</small>
                        </li>
                        <li class="list">
                            <div class="profile"><img src="images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                            <div class="info">
                                <div class="wrapper d-flex">
                                    <p>Catherine</p>
                                </div>
                                <p>Away</p>
                            </div>
                            <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                            <small class="text-muted my-auto">23 min</small>
                        </li>
                        <li class="list">
                            <div class="profile"><img src="images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                            <div class="info">
                                <p>Daniel Russell</p>
                                <p>Available</p>
                            </div>
                            <small class="text-muted my-auto">14 min</small>
                        </li>
                        <li class="list">
                            <div class="profile"><img src="images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                            <div class="info">
                                <p>James Richardson</p>
                                <p>Away</p>
                            </div>
                            <small class="text-muted my-auto">2 min</small>
                        </li>
                        <li class="list">
                            <div class="profile"><img src="images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                            <div class="info">
                                <p>Madeline Kennedy</p>
                                <p>Available</p>
                            </div>
                            <small class="text-muted my-auto">5 min</small>
                        </li>
                        <li class="list">
                            <div class="profile"><img src="images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                            <div class="info">
                                <p>Sarah Graves</p>
                                <p>Available</p>
                            </div>
                            <small class="text-muted my-auto">47 min</small>
                        </li>
                    </ul>
                </div>
                <!-- chat tab ends -->
            </div>
        </div>
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item active">
                    <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <i class="icon-layout menu-icon"></i>
                        <span class="menu-title">UI Elements</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
                        <i class="icon-ban menu-icon"></i>
                        <span class="menu-title">Error pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="error">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="row">
                            <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                <h3 class="font-weight-bold">Welcome Aamir</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card tale-bg">
                            <div class="card-people mt-auto">
                                <img src="images/dashboard/people.svg" alt="people">
                                <div class="weather-info">
                                    <div class="d-flex">
                                        <div>
                                            <h2 class="mb-0 font-weight-normal"><i class="icon-sun mr-2"></i>31<sup>C</sup></h2>
                                        </div>
                                        <div class="ml-2">
                                            <h4 class="location font-weight-normal">Paris</h4>
                                            <h6 class="font-weight-normal">France</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 grid-margin transparent">
                        <div class="row">
                            <div class="col-md-6 mb-4 stretch-card transparent">
                                <div class="card card-tale">
                                    <div class="card-body">
                                        <p class="mb-4">Jogging</p>
                                        <p class="fs-30 mb-2"><%= nb1 %></p>
                                        <p><%= nb1p %>% (30 days)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4 stretch-card transparent">
                                <div class="card card-dark-blue">
                                    <div class="card-body">
                                        <p class="mb-4">Cyclisme</p>
                                        <p class="fs-30 mb-2"><%= nb2 %></p>
                                        <p><%= nb2p %>% (30 days)</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                                <div class="card card-light-blue">
                                    <div class="card-body">
                                        <p class="mb-4">Ski</p>
                                        <p class="fs-30 mb-2"><%= nb3 %></p>
                                        <p><%= nb3p %>% (30 days)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 stretch-card transparent">
                                <div class="card card-light-danger">
                                    <div class="card-body">
                                        <p class="mb-4">Marche</p>
                                        <p class="fs-30 mb-2"><%= nb4 %></p>
                                        <p><%= nb4p %>% (30 days)</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <p class="card-title">Statistiques </p>
                                <p class="font-weight-500">Le nombre total de sessions dans la plage de dates. C'est la période pendant laquelle un utilisateur est activement engagé avec une activité sportive</p>
                                <div class="d-flex flex-wrap mb-5">
                                    <div class="mr-5 mt-3">
                                        <p class="text-muted">Order value</p>
                                        <h3 class="text-primary fs-30 font-weight-medium">12.3k</h3>
                                    </div>
                                    <div class="mr-5 mt-3">
                                        <p class="text-muted">Orders</p>
                                        <h3 class="text-primary fs-30 font-weight-medium">14k</h3>
                                    </div>
                                    <div class="mr-5 mt-3">
                                        <p class="text-muted">Users</p>
                                        <h3 class="text-primary fs-30 font-weight-medium">71.56%</h3>
                                    </div>
                                    <div class="mt-3">
                                        <p class="text-muted">Downloads</p>
                                        <h3 class="text-primary fs-30 font-weight-medium">34040</h3>
                                    </div>
                                </div>
                                <canvas id="order-chart" style="display: block; width: 465px; height: 232px;" width="465" height="232" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p class="card-title">Sales Report</p>
                                    <a href="#" class="text-info">View all</a>
                                </div>
                                <p class="font-weight-500">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>
                                <div id="sales-legend" class="chartjs-legend mt-4 mb-2">
                                    <ul class="1-legend">
                                        <li><span style="background-color: rgb(152, 189, 255);"></span>Offline Sales</li>
                                        <li><span style="background-color: rgb(75, 73, 172);"></span>Online Sales</li>
                                    </ul>
                                </div>
                                <canvas id="sales-chart" width="465" height="232" style="display: block; width: 465px; height: 232px;" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Advanced Table</p>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive">
                                            <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6"></div>
                                                    <div class="col-sm-12 col-md-6"></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table id="example" class="display expandable-table dataTable no-footer" style="width: 100%;" role="grid">
                                                            <thead>
                                                            <tr role="row">
                                                                <th class="sorting_desc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column ascending" style="width: 85px;" aria-sort="descending">Name</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 139px;">Date de Debut</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 132px;">Date de fin</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 95px;">Durée</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 73px;">View</th>
                                                                <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Updated at: activate to sort column ascending" style="width: 116px;">Delete</th>
                                                                <th class="details-control sorting_disabled" rowspan="1" colspan="1" aria-label="" style="width: 8px;"></th>
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

                                                            <tr class="odd">
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
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-5"></div>
                                                    <div class="col-sm-12 col-md-7"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="ti-heart text-danger ml-1"></i></span>
                </div>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="assets/vendors/chart.js/Chart.min.js"></script>
<script src="assets/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="js/dataTables.select.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="assets/js/off-canvas.js"></script>
<script src="assets/js/hoverable-collapse.js"></script>
<script src="assets/js/template.js"></script>
<script src="assets/js/settings.js"></script>
<script src="assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->
</body>
</html>