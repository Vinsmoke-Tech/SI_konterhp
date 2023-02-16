<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:home.php');
};

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>orders</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<body>

   <!-- header section starts  -->
   <?php include 'components/user_header.php'; ?>
   <!-- header section ends -->

   <div class="heading">
      <h3>orders</h3>
      <p><a href="html.php">home</a> <span> / orders</span></p>
   </div>

   <section class="orders">

      <h1 class="title">pesanan kamu</h1>

      <div class="box-container">

   <?php
      if($user_id == ''){
         echo '<p class="empty">please login to see your orders</p>';
      }else{
         $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
         $select_orders->execute([$user_id]);
         if($select_orders->rowCount() > 0){
            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
   ?>
         <div class="box">
            <p>tanggal pesan : <span><?= $fetch_orders['placed_on']; ?></span></p>
            <p>nama : <span><?= $fetch_orders['name']; ?></span></p>
            <p>email : <span><?= $fetch_orders['email']; ?></span></p>
            <p>nomor : <span><?= $fetch_orders['number']; ?></span></p>
            <p>alamat : <span><?= $fetch_orders['address']; ?></span></p>
            <p>metode pembayaran : <span><?= $fetch_orders['method']; ?></span></p>
               
         
            <p>nama produk dan jumlah : <span><?=  $fetch_orders['total_products']; ?></span></p>
            <?php
               $price = number_format($fetch_orders['total_price'],0,",","."); 
            ?>
            <p>total harga : <span>Rp.<?=  $price ?>/-</span></p>
            <p> upload bukti pembayaran: <span> <a class="btn-konfirm" href="upload.php"> upload
                  </a> </span> </p>
            <p> Konfirmasi Pembayaran : <span> <a class="btn-konfirm" href="https://wa.me/6282143131275"> konfirmasi
                  </a> </span> </p>
            <p> status pembayaran : <span
                  style="color:<?php if($fetch_orders['payment_status'] == 'belum bayar'){ echo 'red'; }elseif($fetch_orders['payment_status'] == 'cod'){ echo 'brown'; }else{ echo 'green'; }; ?>"><?= $fetch_orders['payment_status']; ?></span>
            </p>
            <p> status pengiriman : <span
                  style="color:<?php if($fetch_orders['order_status'] == 'menunggu pembayaran'){ echo 'blue'; }elseif($fetch_orders['order_status'] == 'packing'){ echo 'black'; }else{ echo 'orange'; }; ?>"><?= $fetch_orders['order_status']; ?></span>
            </p>
            <p> cek ongkir: <span> <a class="btn-konfirm" href="ongkir/index.html"> cek  
                  </a> </span> </p>
         </div>
         <?php
      }
      }else{
         echo '<p class="empty">no orders placed yet!</p>';
      }
      }
   ?>

      </div>

   </section>










   <!-- footer section starts  -->
   <?php include 'components/footer.php'; ?>
   <!-- footer section ends -->






   <!-- custom js file link  -->
   <script src="js/script.js"></script>

</body>

</html>