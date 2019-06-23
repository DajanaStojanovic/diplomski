<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}


$izraz = $veza->prepare("select * from oblik_ploce where broj_igraca=:broj_igraca");
$izraz -> bindParam(":broj_igraca", $_GET["brojIgraca"]);
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){
	$updateNaraudzba=$veza->prepare("update narudzba set
		oblik_ploce=:oblik_ploce
		where id=:id");
        $updateNaraudzba->bindParam(":oblik_ploce", $_POST['oblikPloce']);
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

        header("location: odabirBoje.php?id=" . $_POST['idNarudzbe'] . "&oblikPloce=" . $_POST['oblikPloce'] ."");
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
	<div class="titlePages">Odabir vrstu ploče</div>
</div>
<img alt="breadCrumbs" src="images/breadcrumbsVrstaPloce.png" class="breadCrumbs" />
<div class="titlePageSingle">Kakvu ploču želiš?</div>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="oblikPloceContainer">
		<?php foreach ($rezultati as $r): ?>
	        <div class="selectContainer">
	        	<img alt="igrači" src="images/<?php echo $r->slika ?>"/>
	            <input type="radio" name="oblikPloce" class="radioButton" value="<?php echo $r->id ?>">
	        </div>
	    <?php endforeach; ?>
	    
	</div>


    <div class="buttonsContainer">
		<input class="buttonOdustani" type="submit" name="buttonOdustani" value="ODUSTANI" />

		<input class="buttonDalje" type="submit" name="buttonDalje" value="DALJE" disabled/>
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
	<input type="hidden" name="brojIgraca" value="<?php echo $_GET['brojIgraca'] ?>">
</form>


<?php include 'footer.php' ?>