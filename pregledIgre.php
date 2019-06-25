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
	<div class="titlePages">Pregled napravljene igre</div>
</div>
<div class="pageText">Ovako izgleda igra koju si napravio/la, te figurica koju si odabrao/la.</div>
<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="pregledPloceContainer">
		<object class="pdfPregled" data="pdfUploads/narudzbaId<?php echo $_GET['id']?>.pdf#toolbar=0" type="application/pdf">
	        <embed height="100%" width="100%" src="pdfUploads/narudzbaId<?php echo $_GET['id']?>.pdf#toolbar=0" type="application/pdf" />
		</object>


		<?php foreach ($rezultati as $r): ?>
	        <div class="pregledContainer">
	        	<img alt="igrači" src="images/<?php echo $r->slika ?>"/>
	        </div>
	    <?php endforeach; ?>
	    
	</div>


    <div class="buttonsContainer">
		<input class="buttonOdustani" type="submit" name="buttonOdustani" value="ODUSTANI" />

		<input class="buttonDalje buttonActive" type="submit" name="buttonDalje" value="DALJE" />
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
</form>

<script>
	var cw = $('.pdfPregled').width();
$('.pdfPregled').css({
    'width': cw + 'px',
    'height': cw + 'px',
});

</script>

<?php include 'footer.php' ?>