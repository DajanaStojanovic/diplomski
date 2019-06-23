<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}


$izraz = $veza->prepare("select * from oblik_ploce where id=:oblikPloce");
$izraz -> bindParam(":oblikPloce", $_GET["oblikPloce"]);
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){
	$updateNaraudzba=$veza->prepare("update narudzba set
		boja_ploce=:boja_ploce
		where id=:id");
        $updateNaraudzba->bindParam(":boja_ploce", $_POST['bojaPloce']);
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

        header("location: odabirFigurica.php?id=" . $_POST['idNarudzbe'] . "&oblikPloce=" . $_POST['oblikPloce'] ."");
};

if(isset($_POST["buttonOdustani"])) {
	$updateNaraudzba=$veza->prepare("delete from narudzba
		where id=:id");
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

        header("location: index.php");
};
?>
<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Odabir boje ploče</div>
</div>
<img alt="breadCrumbs" src="images/breadcrumbsBojaPloce.png" class="breadCrumbs" />
<div class="titlePageSingle">Koje boje želiš da bude tvoja Ultra HC igra?</div>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="oblikPloceContainer">
		<?php foreach ($rezultati as $r): ?>
	       <img alt="Ploča" id="boardImage" class="boardImage" src="images/b<?php echo $r->slika ?>" />
	    <?php endforeach; ?>

	        <div class="selectContainerColor">
	        	<div id="color-picker-container"></div>
				<div id="values"></div>
	        </div>
	    
	</div>


    <div class="buttonsContainer">
		<input class="buttonOdustani" type="submit" name="buttonOdustani" value="ODUSTANI" />

		<input class="buttonDalje buttonActive" type="submit" name="buttonDalje" value="DALJE" />
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
	<input type="hidden" name="oblikPloce" value="<?php echo $_GET['oblikPloce'] ?>">
</form>

<?php include 'footer.php' ?>