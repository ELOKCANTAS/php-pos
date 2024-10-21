<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();

// Jika form pemilihan produk dikirim
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil produk dan jumlah yang dipilih dari form
   // Ambil produk yang dipilih dari form
$selected_products = $_POST['products'];
$product_quantities = $_POST['product_quantities'];

// Create an associative array from the selected products and quantities
$selected_products_with_quantities = array();
for ($i = 0; $i < count($selected_products); $i++) {
    $selected_products_with_quantities[$selected_products[$i]] = $product_quantities[$i];
}

// Save the selected products and quantities to the session
$_SESSION['selected_products'] = $selected_products_with_quantities;

    // Redirect ke halaman konfirmasi pesanan
    header('Location: make_oder.php');
    exit;
}

require_once('partials/_head.php');
?>

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
                            Pilih Produk
                        </div>
                        <div class="table-responsive">
                            <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                                <table class="table align-items-center table-flush">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col"><b>Select</b></th>
                                            <th scope="col"><b>Image</b></th>
                                            <th scope="col"><b>Kodem Produk</b></th>
                                            <th scope="col"><b>Nama</b></th>
                                            <th scope="col"><b>Harga</b></th>
                                            <th scope="col"><b>Quantity</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $ret = "SELECT * FROM  produk ";
                                        $stmt = $mysqli->prepare($ret);
                                        $stmt->execute();
                                        $res = $stmt->get_result();
                                        while ($prod = $res->fetch_object()) {
                                        ?>
                                            <tr>
                                                <td>
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="product-<?php echo $prod->ProdukID; ?>" name="products[]" value="<?php echo $prod->ProdukID; ?>">
                                                        <label class="custom-control-label" for="product-<?php echo $prod->ProdukID; ?>"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <?php
                                                    if ($prod->ProdukImg) {
                                                        echo "<img src='assets/img/products/$prod->ProdukImg' height='60' width='60 class='img-thumbnail'>";
                                                    } else {
                                                        echo "<img src='assets/img/products/default.jpg' height='60' width='60 class='img-thumbnail'>";
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo $prod->kode_produk; ?></td>
                                                <td><?php echo $prod->NamaProduk; ?></td>
                                                <td> RP<?php echo number_format($prod->Harga); ?></td>
                                                <td>
                                                    <input type="number" class="form-control" name="product_quantities[]" value="1" min="1">
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Confirm Order</button>
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