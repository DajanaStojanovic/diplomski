<?php
//sessioin_start();

$nazivAplikacije="Ultra HC - Diplomski rad";

//za server
//$putanjaApp="";

//lokalno
$putanjaApp="/ultra_hc_diplomski/";
$mysql_host="localhost";
$mysql_database="diplomski";
$mysql_user="root";
$mysql_password="root";

//spajanje na bazu
$veza = new PDO("mysql:dbname=". $mysql_database . "; host=" .$mysql_host . "", $mysql_user, $mysql_password);
$veza->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$veza->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$veza->exec("SET CHARACTER SET utf8");
$veza->exec("SET NAMES utf8");


?>