<?php
include "config.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mosque Timings</title>
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">

  <!-- fontawesome-icons -->
  <link rel="stylesheet" href="vendor/fontawesome-free/css/all.min.css" type="text/css">

  <!-- Custom styles for this template-->
  <link href="vendor/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="vendor/css/fonts.css" rel="stylesheet">
  <link href="vendor/css/index.css" rel="stylesheet">
  <style>
    .mosque-img{
      padding-top: 20px;

    }

    .bg-wrapper {
      min-height: 100vh;
      width: 100vw;
      color: black;
      font-family: 'PlayfairDisplay-Regular';
    }

    .home-container {
      padding-top: 42px;
    }
  </style>
</head>

<body>
  <div class="bg-wrapper">
    <!-- NAVBAR BEGIN -->
    <section class="home-nav fixed-top">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand logo d-none d-md-block" href="index.html">Society Management System</a>
          <a class="navbar-brand logo d-block d-md-none" href="index.html">SMS</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link home-links" href="index.html">Home<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link home-links" href="#">Mosque Timings</a>
              </li>
              <li class="nav-item">
                <a class="nav-link home-links" href="hospital.html">Society Hospital</a>
              </li>
              <li class="nav-item">
                <a class="nav-link home-links" href="login.php">Login</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </section>
    <!-- NAVBAR END -->
    <div class="home-container">
      <div class="row">
        <div class="col-md-7 order-last order-md-first align-self-center">
          <div class="text-header text-center">
            Society Mosque<br>
          </div>
          <div class="text-center my-auto" style="font-size: 25px; font-family: 'Times New Roman', Times, serif;">
            <p>Check the updated prayer times of the Society Mosque.</p>
          </div>
        </div>
        <div class="col-md-5 text-center home-img-col">
          <img src="vendor\img\mosque.jpg" alt="mosque" class="mosque-img">
        </div>
      </div>
    </div>
    <div class="row" style="background-color: #cfcfcf;">
      <div class="col-12 py-2 text-center font-weight-bold" style="font-size:2rem;text-transform: uppercase;">Mosque
        Timings<br></div>
    </div>
    <div class="mx-4 my-5">
      <div class="card-deck">
        <div class="card card1 shadow justify-content-center align-items-center">
          <div class="card-body text-center">
            <div class="overlay"></div>
            <div class="circle">
              <i class="fas fa-duotone fa-cloud-sun"></i>
            </div>           
            <?php
            $sql = "SELECT * FROM `namaz` WHERE NamazId=1";
            $result = mysqli_query($con, $sql);
            $data = $result->fetch_assoc();
            echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Fajar Namaz<br>".$data["NamazTime"]." AM</p>";
            ?>
          </div>
        </div>
        <div class="card card2 shadow justify-content-center align-items-center">
          <div class="card-body text-center">
            <div class="overlay"></div>
            <div class="circle">
              <i class="fas fa-duotone fa-sun"></i>
            </div>
            <?php
            $sql = "SELECT * FROM `namaz` WHERE NamazId=2";
            $result = mysqli_query($con, $sql);
            $data = $result->fetch_assoc();
            echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Zuhr Namaz<br>".$data["NamazTime"]." PM</p>";
            ?>          
          </div>
        </div>
        <div class="card card3 shadow justify-content-center align-items-center">
          <div class="card-body text-center">
            <div class="overlay"></div>
            <div class="circle">
              <i class="fas fa-solid fa-tree"></i>
            </div>
            <?php
            $sql = "SELECT * FROM `namaz` WHERE NamazId=3";
            $result = mysqli_query($con, $sql);
            $data = $result->fetch_assoc();
            echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Asar Namaz<br>".$data["NamazTime"]." PM</p>";
            ?>  
          </div>
        </div>
        <div class="card card4 shadow justify-content-center align-items-center">
          <div class="card-body text-center">
            <div class="overlay"></div>
            <div class="circle">
              <i class="fas fa-solid fa-star-and-crescent"></i>
            </div>
            <?php
            $sql = "SELECT * FROM `namaz` WHERE NamazId=4";
            $result = mysqli_query($con, $sql);
            $data = $result->fetch_assoc();
            echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Maghrib Namaz<br>".$data["NamazTime"]." PM</p>";
            ?>  
          </div>
        </div>
        <div class="card card5 shadow justify-content-center align-items-center">
          <div class="card-body text-center">
            <div class="overlay"></div>
            <div class="circle">
              <i class="fas fa-solid fa-mosque"></i>
            </div>
            <?php
            $sql = "SELECT * FROM `namaz` WHERE NamazId=5";
            $result = mysqli_query($con, $sql);
            $data = $result->fetch_assoc();
            echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Isha Namaz<br>".$data["NamazTime"]." PM</p>";
            ?>  
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12 py-5">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; 2022 MSM Society, All Rights Reserved.</span>
        </div>
      </div>
    </div>
</body>

<section>
  <!-- ADD DESCRIPTION HERE -->
</section>

<section>
  <!-- ADD FOOTER HERE -->
</section>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="vendor/js/sb-admin-2.min.js"></script>
<!-- SWIPER JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>
  $(document).ready(function () {
    $(window).scroll(function () {
      var scroll = $(window).scrollTop();
      if (scroll > 80) {
        $(".home-nav").css("background", "#0009");
        $(".home-links").css("color", "white");
        $(".logo").css("color", "white");
      }

      else {
        $(".home-nav").css("background", "");
        $(".home-links").css("color", "black");
        $(".logo").css("color", "black");

      }
    })
  });

  $(document).ready(function () {
    $(window).scroll(function () {
      var scroll = $(window).scrollTop();
      if (scroll > 80) {
        $(".home-nav").css("backdrop-filter", "saturate(190%) blur(10px)");
      }

      else {
        $(".home-nav").css("backdrop-filter", "");
      }
    })
  });
</script>
<!-- </body>  -->

</html>