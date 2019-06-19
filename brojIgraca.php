<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$izraz = $veza->prepare("select * from broj_igraca");
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);
?>

<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Odabir broja igrača</div>
</div>
<img alt="breadCrumbs" src="images/breadcrumbsIgraci.png" class="breadCrumbs" />
<div class="titlePageSingle">Za koliko igrača želiš kreirati igru?</div>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="brojIgracaContainer">
		<?php foreach ($rezultati as $r): ?>
	        <div class="selectContainer">
	        	<img alt="igrači" src="images/<?php echo $r->slika ?>"/>
	        	<p class="price"><?php echo $r->cijena ?> kn *</p>
	            <input type="radio" name="brojIgraca" class="radioButton" value="<?php echo $r->id ?>">
	        </div>
	    <?php endforeach; ?>
	    <p class="pdv">* PDV je uključen u cijenu</p>
	</div>


    <div class="buttonsContainer">
		<a href="index.php" class="buttonOdustani">
			ODUSTANI
		</a>

		<input class="buttonDalje" type="submit" name="buttonDalje" value="DALJE" disabled/>
	</div>
</form>

<?php if(isset($_POST["buttonDalje"])){
	$izraz=$veza->prepare("insert into narudzba 
		(broj_igraca) values 
		(:broj_igraca)");
        $izraz->bindParam(":broj_igraca", $_POST['brojIgraca']);
        $izraz->execute();
        $idZapis = $veza->lastInsertId();

        header("location: odabirOblikaPloce.php?id=" . $idZapis . "&brojIgraca=" . $_POST['brojIgraca'] ."");

};

include 'footer.php' ?>