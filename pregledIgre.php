<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}


$izraz = $veza->prepare("select * from narudzba inner join figurice on narudzba.figurice=figurice.id where narudzba.id=:id");
$izraz -> bindParam(":id", $_GET["id"]);
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){

        header("location: podaciZaDostavu.php?id=" . $_POST['idNarudzbe'] . "");
};


?>

<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Pregled napravljene igre</div>
</div>
<div class="pageText">Ovako izgleda igra koju si napravio/la, te figurica koju si odabrao/la.</div>
<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="oblikPloceContainer">
		<?php foreach ($rezultati as $r): ?>
	        <div class="pregledContainer">
	        	<img alt="igrači" src="images/<?php echo $r->slika ?>"/>
	        </div>
	    <?php endforeach; ?>
	    
	</div>


    <div class="buttonsContainer">
		<a href="brojIgraca.php" class="buttonOdustani">
			NAZAD
		</a>

		<input class="buttonDalje buttonActive" type="submit" name="buttonDalje" value="DALJE" />
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
</form>


<?php include 'footer.php' ?>