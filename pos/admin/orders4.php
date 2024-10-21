<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();
require_once('partials/_head.php');

if (isset($_POST['add_to_cart'])) {
    if (isset($_SESSION['cart'])) {
        $session_array = array(
            'ProdukID' => $_GET['ProdukID'],
            "NamaProduk" => $_POST['NamaProduk'],
            "Harga" => $_POST['Harga'],
            "quantity" => $_POST['quantity']
        );
        $_SESSION['cart'][] = $session_array;
    } else {
        $session_array = array(
            'ProdukID' => $_GET['ProdukID'],
            "NamaProduk" => $_POST['NamaProduk'],
            "Harga" => $_POST['Harga'],
            "quantity" => $_POST['quantity']
        );
        $_SESSION['cart'] = array($session_array);
    }
}

if (isset($_GET['action']) && $_GET['action'] == 'remove') {
    foreach ($_SESSION['cart'] as $key => $value) {
        if ($value['ProdukID'] == $_GET['id']) {
            unset($_SESSION['cart'][$key]);
        }
    }
}
?>

<!-- The rest of the code remains the same -->

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
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="text-center mb-5">Shopping Cart Data</h2>
                    <div class="row">
                        <?php
                        $ret = "SELECT * FROM  produk";
                        $stmt = $mysqli->prepare($ret);
                        $stmt->execute();
                        $res = $stmt->get_result();
                        while ($prod = $res->fetch_object()) {
                        ?>
                        <div class="col-md-4 mb-4">
<form method="POST" action="orders.php?ProdukID=<?=$prod->ProdukID ?>" class="h-100 d-flex flex-column justify-content-between">
                                <div>
                                    <?php
                                    if ($prod->ProdukImg) {
                                        echo "<img src='assets/img/products/$prod->ProdukImg' class='img-fluid rounded mb-3'>";
                                    } else {
                                        echo "<img src='assets/img/products/default.jpg' class='img-fluid rounded mb-3'>";
                                    }
                                    ?>
                                     <input type="hidden" name="NamaProduk" value="<?php echo $prod->NamaProduk; ?>">
                                    <input type="hidden" name="NamaProduk" value="<?php echo $prod->NamaProduk; ?>">
                                    <input type="hidden" name="Harga" value="RP <?php echo number_format($prod->Harga); ?>">
                                </div>
                                <div class="text-center">
                                     <h5 class="text-center"><?php echo $prod->NamaProduk; ?></h5>
                                    <h5 class="text-center">RP <?php echo number_format($prod->Harga); ?></h5>
                                    <input type="number" name="quantity" value="1" class="form-control">
                                    <input type="submit" name="add_to_cart" class="btn btn-secondary btn-block my-2" value="Add To Cart">
                                </div>
                            </form>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                <div class="col-md-6">
                    <h2 class="text-center">Item yang Dipilih</h2>

                    <?php

                    $output = "";

                    $output .= "
                    <table class='table table-bordered table-striped'>
                    <tr>
                    <th>ID</th>
                     <th>Nama Produk</th>
                      <th>Harga Produk</th>
                       <th>Quantity</th>
                        <th>Harga Total</th>
                         <th>Aksi</th>
                         <tr>

                    ";

                    if(!empty($_SESSION['cart'])) {

                        foreach ($_SESSION['cart'] as $key => $value) {

                            $output .= "
                            <tr>
                            <td>".$value['ProdukID']."</td>
                             <td>".$value['NamaProduk']."</td>
                              <td>".$value['Harga']."</td>
                               <td>".$value['quantity']."</td>
                               <td>".number_format((float)str_replace('RP ', '', $value['Harga']) * $value['quantity'], 3, '.', ',')."</td>
                                 <td>
                                 <a href='orders.php?action=remove&id=".$value['ProdukID']."'>
                                 <button class='btn btn-danger btn-block'>Hapus</button>
                                 </a>

                                 </td>


                            ";
                            # code...
                        }
                    }






                    echo $output;
                    ?>
                </div>
            </div>
        </div>
        <?php
        require_once('partials/_footer.php');
        ?>
    </div>
    <!-- Argon Scripts -->
    <?php
    require_once('partials/_scripts.php');
    ?>
</body>

</html>