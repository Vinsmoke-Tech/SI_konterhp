<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['submit'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = sha1($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

   $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? OR number = ?");
   $select_user->execute([$email, $number]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if($select_user->rowCount() > 0){
      $message[] = 'email or number already exists!';
   }else{
      if($pass != $cpass){
         $message[] = 'confirm password not matched!';
      }else{
         $insert_user = $conn->prepare("INSERT INTO `users`(name, email, number, password) VALUES(?,?,?,?)");
         $insert_user->execute([$name, $email, $number, $cpass]);
         $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
         $select_user->execute([$email, $pass]);
         $row = $select_user->fetch(PDO::FETCH_ASSOC);
         if($select_user->rowCount() > 0){
            $_SESSION['user_id'] = $row['id'];
            header('location:home.php');
         }
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
 <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login_V1/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_V1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_V1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_V1/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_V1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_V1/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_V1/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login_V1/css/main.css">
<!--===============================================================================================-->

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
					<img src="Login_V1/images/img-01.png" alt="IMG">
				</div>

				<form action="" method="post" class="login100-form validate-form">
					<span class="login100-form-title">
						Daftar
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid name required">
                     <input type="text" name="name" placeholder="tulis nama lengkap" class="input100" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-person" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
               <input type="email" name="email" placeholder="Masukan email Anda" class="input100" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
               <div class="wrap-input100 validate-input" data-validate = "nomor wa is required">
               <input type="number" name="number" placeholder="Masukan nomor WA" class="input100" min="0" max="9999999999" maxlength="10">	<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-phone" aria-hidden="true"></i>
						</span>
					</div>
               <div class="wrap-input100 validate-input" data-validate = "Password is required">
               <input type="password" name="pass"  placeholder=" password anda" class="input100" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">	<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
               <div class="wrap-input100 validate-input" data-validate = "Password is required">
               <input type="password" name="cpass"  placeholder="ulangi password anda" class="input100" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">	<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
            
               <input type="submit" value="Daftar" name="submit" class="login100-form-btn">
            


					<div class="text-center p-t-136">
						<a class="txt2" href="#">
                  <p>already have an account? <a href="login.php">login now</a></p>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>


















<?php include 'components/footer.php'; ?>





	
<!--===============================================================================================-->	
<script src="Login_V1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_V1/vendor/bootstrap/js/popper.js"></script>
	<script src="Login_V1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_V1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_V1/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="Login_V1/js/main.js"></script>




</body>
</html>