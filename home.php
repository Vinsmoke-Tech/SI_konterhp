<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/add_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>

<?php include 'components/user_header.php'; ?>



<section class="hero">

            <div class="image">
               <img src="images/wahyucellheader.jpg" alt="">
            </div>
            <div class="content">
               <span>order online</span>
               <h3>WAHYU CELL</h3>
               <a href="menu.php" class="btn">lihat katalog</a>
            </div><br><br>
            <div class="image">
               </div>

            </section>
            <center>

               <img  src= "images/gratisongkir.png" width="250px" height="270px" alt="" srcset=""><br>
               <h2>Gratis ongkir pembelian diatas Rp. 2.000.000 <h2>
            </center>

<div class="category">
   <div class="kategori">
   <h1 class="title">kategori</h1>
   
   <div class="box-container">
      
      <a href="category.php?category=handphone" class="box">
         <img src="images/hp.png" alt="">
         <h3>handphone</h3>
      </a>
      
      <a href="category.php?category=aksesoris" class="box">
         <img src="images/aksesoris.png" alt="">
         <h3>Aksesoris</h3>
      </a>
      
      <a href="category.php?category=paket" class="box">
         <img src="images/data.png" alt="">
         <h3>Paket Data</h3>
      </a>
   </div>
   
</div>
</div>




<section class="products">

   <h1 class="title">produk paling laku</h1>

   <div class="box-container">

      <?php
         $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6");
         $select_products->execute();
         if($select_products->rowCount() > 0){
            while($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)){
      ?>
      <form action="" method="post" class="box">
         <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
         <input type="hidden" name="name" value="<?= $fetch_products['name']; ?>">
         <input type="hidden" name="price" value="<?= $fetch_products['price']; ?>">
         <input type="hidden" name="stok" value="<?= $fetch_products['stok']; ?>">
         <input type="hidden" name="image" value="<?= $fetch_products['image']; ?>">
         <a href="quick_view.php?pid=<?= $fetch_products['id']; ?>" class="fas fa-eye"></a>
         <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
         <img src="uploaded_img/<?= $fetch_products['image']; ?>" alt="">
         <a href="category.php?category=<?= $fetch_products['category']; ?>" class="cat"><?= $fetch_products['category']; ?></a>
         <div class="name"><?= $fetch_products['name']; ?></div>
         <div class="name">Stok : <?= $fetch_products['stok']; ?></div>
         <div class="flex">
            <?php
            /* titik rupiah */
              $price = number_format($fetch_products['price'],0,",","."); 
         
            ?>
            <div class="price"><span>Rp</span><?= $price ?></div>
            <input type="number" name="qty" class="qty" min="1" max="99" value="1" maxlength="2">
         </div>
      </form>
      <?php
            }
         }else{
            echo '<p class="empty">no products added yet!</p>';
         }
      ?>

   </div>

   <div class="more-btn">
      <a href="menu.php" class="btn">veiw all</a>
   </div>

</section>

<?php include 'components/footer.php'; ?>


<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".hero-slider", {
   loop:true,
   grabCursor: true,
   effect: "flip",
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
});

</script>

</body>
</html>