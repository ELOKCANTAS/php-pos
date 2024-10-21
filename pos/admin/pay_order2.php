<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();

// Ambil data dari URL
$kode_penjualan = $_GET['kode_penjualan'];
$PelangganID = $_GET['PelangganID'];
$status = $_GET['status'];

// Ambil data pesanan dari tabel penjualan
$ret = "SELECT * FROM penjualan WHERE kode_penjualan = ?";
$stmt = $mysqli->prepare($ret);
$stmt->bind_param('s', $kode_penjualan);
$stmt->execute();
$res = $stmt->get_result();
$order = $res->fetch_object();

// Cek apakah pesanan ada
if ($order) {
    // Ambil data produk dari session cart
    $cart_data = json_decode($_SESSION['cart'], true);

    // Cek apakah cart tidak kosong
    if (!empty($cart_data)) {
        // Looping untuk memasukkan data ke tabel detailpenjualan
        foreach ($cart_data as $item) {
            $stmt = $mysqli->prepare("INSERT INTO detailpenjualan (PenjualanID, ProdukID, kode_pembayaran, kode_penjualan, JumlahProduk, TotalHarga, DibuatPada) VALUES (?, ?, ?, ?, ?, ?, NOW())");
            $stmt->bind_param(
                'iissid',
                $order->PenjualanID,
                $item['ProdukID'],
                uniqid(),
                $order->kode_penjualan,
                $item['quantity'],
                $item['Harga'] * $item['quantity']
            );

            if (!$stmt->execute()) {
                // Handle execution error
                error_log("Failed to insert detail: " . $stmt->error);
            }
        }
    } else {
        error_log("Cart is empty");
    }

    // Update status pesanan di tabel penjualan
    $stmt = $mysqli->prepare("UPDATE penjualan SET status = ? WHERE kode_penjualan = ?");
    $stmt->bind_param('ss', $status, $kode_penjualan);
    $stmt->execute();

    // Hapus session cart
    unset($_SESSION['cart']);

    // Redirect ke halaman payments.php
    header("Location: payments.php");
} else {
    error_log("Order not found for kode_penjualan: " . $kode_penjualan);
    header("Location: payments.php?error=OrderNotFound");
}
?>