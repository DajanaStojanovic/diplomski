<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}


$izraz = $veza->prepare("select * from figurice");
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){
	$updateNaraudzba=$veza->prepare("update narudzba set
		figurice=:figurice
		where id=:id");
        $updateNaraudzba->bindParam(":figurice", $_POST['figuricaId']);
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

         header("location: odabirPravila.php?id=" . $_POST['idNarudzbe'] . "&oblikPloce=" . $_POST['oblikPloce'] ."");
};
?>
<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Odabir figurica</div>
</div>
<img alt="breadCrumbs" src="images/breadcrumbsFigurice.png" class="breadCrumbs" />
<div class="titlePageSingle">Koju vrstu figurica želiš?</div>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="brojIgracaContainer">
		<?php foreach ($rezultati as $r): ?>
			<div class="selectContainer">
	        	<img alt="Ploča" id="figuriceImage" class="figuriceImage" src="images/<?php echo $r->slika ?>" />
	            <input type="radio" name="figuricaId" class="radioButton" value="<?php echo $r->id ?>">
	        </div>

	    <?php endforeach; ?>
	</div>
	       
    <div class="buttonsContainer">
		<a href="brojIgraca.php" class="buttonOdustani">
			NAZAD
		</a>

		<input class="buttonDalje" type="submit" name="buttonDalje" value="DALJE" disabled />
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
	<input type="hidden" name="oblikPloce" value="<?php echo $_GET['oblikPloce'] ?>">
</form>


<?php include 'footer.php' ?>