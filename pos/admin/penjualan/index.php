<?php
session_start();
include('../config/config.php');
include('../config/checklogin.php');
check_login();
require_once('../partials/_head.php');
?>

<body>
    <!-- Sidenav -->
    <?php require_once('../partials/_sidebar.php'); ?>
    
    <!-- Main content -->
    <div class="main-content">
        <!-- Top navbar -->
        <?php require_once('../partials/_topnav.php'); ?>
        
        <!-- Header -->
        <main class="container border py-3">
            <br><br><br>
            <!-- Pencarian -->
            <div class="row">
                <div class="col-sm-8"><h3>Daftar Penjualan</h3></div>
                <div class="col-sm-4">
                    <form class="d-flex" method="GET" action="">
                        <input class="form-control me-2" type="date" name="tgl">
                        <button class="btn btn-primary" type="submit">Cari</button>
                    </form>
                </div>
            </div>
            <!-- Akhir pencarian -->

            <table class="table table-hover table-striped table-sm">
                <thead class="bg-primary text-white">
                    <tr>
                        <th class="py-2 px-3 rounded-start" width="55px">No.</th>
                        <th class="py-2" width="200px">Tanggal</th>
                        <th class="py-2 text-end" width="100px">Total Harga</th>
                        <th class="py-2 text-end" width="100px">Bayar</th>
                        <th class="py-2 text-end" width="100px">Kembali</th>
                        <th class="py-2 px-3" width="200px">Pelanggan</th>
                        <th class="py-2" width="200px">Petugas</th>
                        <th class="py-2 text-center rounded-end" width="130px">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php  
                    include "../config/config.php";
                    $UserID = $_SESSION['UserID'];
                    $batas = 10;
                    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
                    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;    

                    $previous = $halaman - 1;
                    $next = $halaman + 1;
                    $tglskr = date("Y-m-d");

                    if (isset($_GET['tgl'])) {
                        $tgl = $_GET['tgl'];
                        $sqldata = "SELECT * FROM penjualan WHERE tanggal LIKE '$tgl%' AND UserID='$UserID'";
                    } else {
                        $sqldata = "SELECT * FROM penjualan WHERE tanggal LIKE '$tglskr%' AND UserID='$UserID'";
                    }

                    $resdata = mysqli_query($mysqli, $sqldata);
                    $jumlah_data = mysqli_num_rows($resdata);
                    $total_halaman = ceil($jumlah_data / $batas);

                    if (isset($_GET['tgl'])) {
                        $tgl = $_GET['tgl'];
                        $sql = "SELECT * FROM penjualan WHERE tanggal LIKE '$tgl%' AND UserID='$UserID' LIMIT $halaman_awal, $batas";
                    } else {
                        $sql = "SELECT * FROM penjualan WHERE tanggal LIKE '$tglskr%' AND UserID='$UserID' LIMIT $halaman_awal, $batas";
                    }

                    $result = mysqli_query($mysqli, $sql);
                    $no = $halaman_awal + 1;

                    while ($data = mysqli_fetch_array($result)) {
                        $tohar = number_format($data['total_harga'], 0, ",", ".");
                        $byr = number_format($data['bayar'], 0, ",", ".");
                        $kembali = $data['bayar'] - $data['total_harga'];
                        $kbl = number_format($kembali, 0, ",", ".");
                        $id_pelanggan = $data['id_pelanggan'];
                        $id_petugas = $data['id_petugas'];

                        $sqlpetugas = "SELECT * FROM petugas WHERE id_petugas='$id_petugas'";
                        $respetugas = mysqli_query($koneksi, $sqlpetugas);
                        $dtpetugas = mysqli_fetch_array($respetugas);

                        $sqlpelanggan = "SELECT * FROM pelanggan WHERE id_pelanggan='$id_pelanggan'";
                        $respelanggan = mysqli_query($koneksi, $sqlpelanggan);
                        $dtpelanggan = mysqli_fetch_array($respelanggan);
                    ?>
                    <tr>
                        <td class="px-3"><?= $no ?>.</td>
                        <td><?= $data['tanggal'] ?></td>
                        <td align="right"><?= $tohar ?></td>
                        <td align="right"><?= $byr ?></td>
                        <td align="right"><?= $kbl ?></td>
                        <td class="px-3"><?= $dtpelanggan['nama_pelanggan'] ?></td>
                        <td><?= $dtpetugas['nama_petugas'] ?></td>
                        <td align="right">
                            <a href="printnota.php?penid=<?= $data['penjualan_id'] ?>&kbl=<?= $kbl ?>" target="blank" class="btn btn-secondary btn-sm">Cetak Nota</a>
                            <a href="detail_penjualan.php?penid=<?= $data['penjualan_id'] ?>&npet=<?= $dtpetugas['nama_petugas'] ?>&npel=<?= $dtpelanggan['nama_pelanggan'] ?>&tgl=<?= $data['tanggal'] ?>&byr=<?= $byr ?>&kbl=<?= $kbl ?>&halaman=<?= $halaman ?>" class="btn btn-primary btn-sm">Detail</a>
                        </td>
                    </tr>

                    <!-- Modal Edit -->
                    <div class="modal fade" id="modaledit<?= $data['penjualan_id'] ?>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Edit Data Produk</h3>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row my-1">
                                        <div class="col-12"></div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" name="save">Simpan</button>
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Batal</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Akhir modal Edit -->

                    <?php
                        $no++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="8" class="text-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-4 text-start py-3">
                                        <a class="btn btn-primary" href="penjualan_simpan.php">[+] Penjualan Baru</a>
                                    </div>
                                    <div class="col-8 text-end py-3">
                                        <ul class="pagination justify-content-end pagination-sm">
                                            <li class="page-item"><a class="page-link" <?php if ($halaman > 1) { echo "href='?halaman=$previous'"; } ?>>&laquo; Previous</a></li>
                                            <?php 
                                            for ($x = 1; $x <= $total_halaman; $x++) {
                                                if ($x == $halaman) {
                                                    echo "<li class='page-item active'><a class='page-link' href='?halaman=$x'>$x</a></li>";
                                                } else {
                                                    echo "<li class='page-item'><a class='page-link' href='?halaman=$x'>$x</a></li>";
                                                }
                                            }
                                            ?>
                                            <li class="page-item"><a class="page-link" <?php if ($halaman < $total_halaman) { echo "href='?halaman=$next'"; } ?>>Next &raquo;</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </main>
        
        <!-- Modal Form -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Input Data Produk</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form method="POST" action="simpan.php?halaman=<?= $halaman ?>">
                        <div class="modal-body">
                            <div class="row my-1">
                                <div class="col-4">Kode Produk</div>
                                <div class="col-8"><input type="text" name="kp" class="form-control"></div>
                            </div>
                            <div class="row my-1">
                                <div class="col-4">Nama Produk</div>
                                <div class="col-8"><input type="text" name="np" class="form-control"></div>
                            </div>
                            <div class="row my-1">
                                <div class="col-4">Harga</div>
                                <div class="col-8"><input type="text" name="hp" class="form-control"></div>
                            </div>
                            <div class="row my-1">
                                <div class="col-4">Stok</div>
                                <div class="col-8"><input type="text" name="sp" class="form-control"></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" name="save">Simpan</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Batal</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Akhir modal Form -->

        <?php require_once('../partials/_scripts.php'); ?>
    </div>
</body>
</html>