<?php
// File: post/cashier/config/check_login.php

function check_login()
{
    if (strlen($_SESSION['UserID']) == 0) {
        $host = $_SERVER['HTTP_HOST'];
        $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
        $extra = "../admin/index.php";
        $_SESSION["UserID"] = "";
        header("Location: http://$host$uri/$extra");
    }
}