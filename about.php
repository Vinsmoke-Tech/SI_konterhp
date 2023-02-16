<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

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
   <h3>about us</h3>
   <p><a href="home.php">home</a> <span> / about</span></p>
</div>

<!-- about section starts  -->

<section class="about">

   <div class="row">

      <div class="image">
         <img src="images/fotodepan.jpg" alt="">
      </div>

      <div class="content">
         <h3>MAU CARI PERLENGKAPAN SMARTPHONE?</h3>
         <p>Wahyu Cell adalah Pusat Belanja Handphone, Accesoris, dan Paket Data secara Online terlengkap dengan harga bersaing dan bergaransi resmi. Melayani Grosir Paket Data dan Grosir Accesoris, Pesan secara online lebih mudah dan cepat tanpa datang langsung ketoko!</p>
         <a href="menu.php" class="btn">our menu</a>
      </div>

   </div>

</section>

<!-- about section ends -->

<!-- steps section starts  -->

<section class="steps">

   <h1 class="title">simple steps</h1>

   <div class="box-container">

      <div class="box">
         <img src="images/step-1.png" alt="">
         <h3>choose order</h3>
         <p>Pilih langsung produk yang anda cari di website ini.</p>
      </div>

      <div class="box">
         <img src="images/step-2.png" alt="">
         <h3>fast delivery</h3>
         <p>Order Lewat Online lebih mudah dan cepat pelayanannya tidak perlu antri, Bisa COD.</p>
      </div>

      

   </div>

</section>

<section class="lokasi">
   <h1 class="title"> LOKASI </h1>
   <div class="row">

      <div class="map">
         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3955.990515926702!2d110.93709731477617!3d-7.4662976946139805!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa95d05a8149dd5f0!2zN8KwMjcnNTguNyJTIDExMMKwNTYnMjEuNCJF!5e0!3m2!1sid!2sid!4v1660795803769!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>  
         </div>
         <div class="kontak">
            <ul>
               <li>Nomor Whatsapp : +62 821-4313-1275 </li>
               <li>Email : mustofaangga500@gmail.com</li>
               <li>Alamat TOKO : JL. SOLO-SRAGEN Km.10 Kauman Rt.05, Masaran, Sragen Kode Pos. 57282</li>

            </ul>
         </div>
      </div>
      </section>

<!-- steps section ends -->

<!-- reviews section starts  -->

<!-- reviews section ends -->



















<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->






<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".reviews-slider", {
   loop:true,
   grabCursor: true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
      slidesPerView: 1,
      },
      700: {
      slidesPerView: 2,
      },
      1024: {
      slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>