
<?php
include '../components/connect.php';
require_once("dompdf/autoload.inc.php");
use Dompdf\Dompdf;
$dompdf = new Dompdf();
$orders =  $conn->prepare("SELECT * FROM `orders`");
$html = '<center><h3>Laporan Penjualan Online Wahyu Cell</h3></center><hr/><br/>';
$html .= '<table border="1" width="100%">
<tr>

 <th>nama</th>
 <th>nomor</th>
 <th>email</th>
 <th>metode pembayaran</th>
 <th>alamat</th>
 <th>nama produk dan jumlah</th>
 <th>total harga</th>
 <th>tanggal pemesanan</th>
 <th>status bayar</th>
 <th>order status</th>

 </tr>';
 $orders->execute();
 if($orders->rowCount() > 0){
         while($fetch_orders = $orders->fetch(PDO::FETCH_ASSOC)){
                
 $html .= "<tr>

 <td>".$fetch_orders['name']."</td>
 <td>".$fetch_orders['number']."</td>
 <td>".$fetch_orders['email']."</td>
 <td>".$fetch_orders['method']."</td>
 <td>".$fetch_orders['address']."</td>
 <td>".$fetch_orders['total_products']."</td>
 <td>".$fetch_orders['total_price']."</td>
 <td>".$fetch_orders['placed_on']."</td>
 <td>".$fetch_orders['payment_status']."</td>
 <td>".$fetch_orders['order_status']."</td>
 </tr>";
         }
}
$html .= "</html>";
$dompdf->loadHtml($html);
// Setting ukuran dan orientasi kertas
$dompdf->setPaper('A4', 'landscape');
// Rendering dari HTML Ke PDF
$dompdf->render();
// Melakukan output file Pdf
$dompdf->stream('laporan.pdf');
?>