<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
include('config/code-generator.php');

check_login();

if (isset($_POST['pay'])) {
    //Prevent Posting Blank Values
    if (empty($_POST["kode_pembayaran"]) || empty($_POST["TotalBayar"])) {
        $err = "Blank Values Not Accepted";
    } else {
        $kode_pembayaran = $_POST['kode_pembayaran'];
        $kode_penjualan = $_GET['kode_penjualan'];
        $TotalBayar = $_POST['TotalBayar'];

        // Retrieve the TotalHarga value from the penjualan table
        $ret = "SELECT TotalHarga, PenjualanID FROM penjualan WHERE kode_penjualan = ?";
        $stmt = $mysqli->prepare($ret);
        $stmt->bind_param('s', $kode_penjualan);
        $stmt->execute();
        $res = $stmt->get_result();
        $order = $res->fetch_object();
        $TotalHarga = $order->TotalHarga;
        $PenjualanID = $order->PenjualanID;

        // Calculate the Kembalian
        $Kembalian = $TotalBayar - $TotalHarga;

        $status = $_GET['status'];

        //Insert Captured information to a database table
        $postQuery = "INSERT INTO detailpenjualan (PenjualanID, kode_penjualan, kode_pembayaran, TotalHarga, TotalBayar, Kembalian) VALUES(?, ?, ?, ?, ?, ?)";
        $upQry = "UPDATE penjualan SET status = ? WHERE kode_penjualan = ?";

        $postStmt = $mysqli->prepare($postQuery);
        $upStmt = $mysqli->prepare($upQry);

        //bind parameters
        $rc = $postStmt->bind_param('issddd', $PenjualanID, $kode_penjualan, $kode_pembayaran, $TotalHarga, $TotalBayar, $Kembalian);
        $rc = $upStmt->bind_param('ss', $status, $kode_penjualan);

        $postStmt->execute();
        $upStmt->execute();

        // Insert products data from the session cart
        if (!empty($_SESSION['cart'])) {
            foreach ($_SESSION['cart'] as $value) {
                $ProdukID = $value['ProdukID'];
                $JumlahProduk = $value['quantity'];
                $insertProductQuery = "INSERT INTO detailpenjualan (PenjualanID, ProdukID, JumlahProduk) VALUES (?, ?, ?)";
                $productStmt = $mysqli->prepare($insertProductQuery);
                $productStmt->bind_param('iii', $PenjualanID, $ProdukID, $JumlahProduk);
                $productStmt->execute();
            }
        }

        //declare a varible which will be passed to alert function
        if ($upStmt && $postStmt) {
            $success = "Dibayar" && header("refresh:1; url=receipts.php");
        } else {
            $err = "Coba Lagi Nanti";
        }
    }
}
require_once('partials/_head.php');
?>

<!-- rest of the code remains the same -->

<body>
    <!-- Sidenav -->
    <?php
    require_once('partials/_sidebar.php');
    ?>
    <!-- Main content -->
    <div class="main-content">
        <!-- Top navbar -->
        <?php
        require_once('partials/_topnav.php');
        $kode_penjualan = $_GET['kode_penjualan'];
        $ret = "SELECT TotalHarga FROM penjualan WHERE kode_penjualan = ?";
        $stmt = $mysqli->prepare($ret);
        $stmt->bind_param('s', $kode_penjualan);
        $stmt->execute();
        $res = $stmt->get_result();
        $order = $res->fetch_object();
        $TotalHarga = $order->TotalHarga;
        ?>

        <!-- Header -->
        <div style="background-image: url(assets/img/theme/restro00.jpg); background-size: cover;" class="header  pb-8 pt-5 pt-md-8">
            <span class="mask bg-gradient-dark opacity-8"></span>
            <div class="container-fluid">
                <div class="header-body">
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--8">
            <!-- Table -->
            <div class="row">
                <div class="col">
                    <div class="card shadow">
                        <div class="card-header border-0">
                            <h3>Please Fill All Fields</h3>
                        </div>
                        <div class="card-body">
                            <form method="POST" enctype="multipart/form-data">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label>Kode Pembayaran</label>
                                        <input type="text" name="kode_pembayaran" value="<?php echo $mpesaCode; ?>" class="form-control" value="">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Total</label>
                                        <input type="text" name="TotalHarga" readonly value="<?php echo number_format($TotalHarga, 0, '.', ','); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <label>Bayar</label>
                                        <input type="text" name="TotalBayar" class="form-control" value="">
                                    </div>
                                </div>
                                <hr>
                                <br>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <input type="submit" name="pay" value="Pay Order" class="btn btn-success" value="">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <?php
            require_once('partials/_footer.php');
            ?>
        </div>
    </div>
    <!-- Argon Scripts -->
    <?php
    require_once('partials/_scripts.php');
    ?>
</body>

</html>