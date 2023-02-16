<?php
include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
    $user_id = $_SESSION['user_id'];
 }else{
    $user_id = '';
    header('location:home.php');
 };

if(isset($_POST['upload'])){

   $nama = $_POST['nama'];
   $nama = filter_var($nama, FILTER_SANITIZE_STRING);


   $image = $_FILES['image']['name'];
   $image = filter_var($image, FILTER_SANITIZE_STRING);
   $image_size = $_FILES['image']['size'];
   $image_tmp_name = $_FILES['image']['tmp_name'];
   $image_folder = 'uploaded_img/'.$image;


      if($image_size > 90000000){
         $message[] = 'image size is too large';
      }else{
         move_uploaded_file($image_tmp_name, $image_folder);

         $insert_product = $conn->prepare("INSERT INTO `bukti`(nama,image) VALUES(?,?)");
         $insert_product->execute([$nama,$image]);

         $message[] = 'upload sukses!';
      }

   }
   if(isset($_POST['cancel'])){
        header('location: orders.php');
   }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<body>
<div class="container">
    
    <div class="row mt-5 p-4">
        <div class="col-6 col-md-4 col-lg-4">
            <label for="">
                <h3>  Upload Butki Pembayaran</h3>
            </label>
    
        </div>
        <div class="col-6 col-md-4 col-lg-6">
            <form action="" method="post" enctype="multipart/form-data">

            <div class="form-group ">
                    <label for="exampleInputEmail1">Nama Pelanggan</label>
                    <input type="text" name="nama">
                </div>         

                <div class="form-group ">
                    <label for="exampleInputEmail1">Upload</label>
                    <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
                </div>          
                <button type="submit" value="upload" name="upload" class="btn btn-success" > Upload </button>
                <button class="btn btn-danger" name="cancel">Cancel</button>    
            </form>
            
                
        </div>
    </div>
</div>

		
	
</body>
</html>