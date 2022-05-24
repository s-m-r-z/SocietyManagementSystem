<?php include './includes/shared/header.php';?>
<?php include './includes/shared/sidebar.php';?>
<?php include './includes/shared/topbar.php';?>

<?php
if(isset($_POST['submit'])) 
{ 
    $namaz = $_POST['namaz'];
    $time = $_POST['time'];

    $sql = "UPDATE `namaz` SET `NamazTime`='$time' WHERE `NamazName` = '$namaz'";
    mysqli_query($con, $sql);
    echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #FF0000;'>Time Updated Successfully</p>";

    // $sql = "SELECT * FROM `namaz` WHERE NamazId=2";
    // $result = mysqli_query($con, $sql);
    // $data = $result->fetch_assoc();
    // echo "<p class='card-heading font-weight-bold' style='font-size:1.5rem;color: #414646;'>Zuhr Namaz<br>".$data["NamazTime"]." PM</p>";

}
?>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h3 class="my-4">Manage Namaz Timings</h3>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card mt-2">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row align-items-center">
                        <div class="col-12 mb-3">
                            <h4 class="m-0 font-weight-bold text-primary">Namaz Timings</h4>
                        </div>
                        <div class="col-6 offset-md-8 col-md-1 text-center">
                        </div>
                    </div>
                </div>

                <!-- Table -->

                <form class="forms-sample" id="namaz_form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <div class="form-check">
                        <br>Namaz: <select name="namaz" id="namaz" required>
                        <option value=""></option>
                        <option value="Fajar">Fajar</option>
                        <option value="Zuhr">Zuhr</option>
                        <option value="Asar">Asar</option>
                        <option value="Maghrib">Maghrib</option>
                        <option value="Isha">Isha</option>
                        </select><p></p>
                        Time: <input type="text" name="time" required><br><br><br>
                        <input type="submit" name="submit" value="Change Namaz Time"><br><br>
                    </div>
<?php

include './includes/shared/footer.php';
include './includes/shared/scripts.php';

?>