<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

if(isset($_POST["buttonDalje"])){
	$updateNaraudzba=$veza->prepare("update narudzba set
		oblik_ploce=:oblik_ploce
		where id=:id");
        $updateNaraudzba->bindParam(":oblik_ploce", $_POST['oblikPloce']);
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

        header("location: odabirBoje.php?id=" . $_POST['idNarudzbe'] . "&oblikPloce=" . $_POST['oblikPloce'] ."");
};


?>

<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Podaci za dostavu</div>
</div>

<div class="pageText">Ostavi svoje podatke i u najkraćem mogućem roku na kućnu adresu ti stiže tvoja personalizirana <b>Ultra HC igra!</b></div>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
	<div class="podaciContainer">
		<div class="osnovniPodaciText">
			Osnovni podaci
		</div>
		<div class="dostavaPodaciText">
			Odabir načina dostave
		</div>
		<div class="osnovniPodaci">
			<div class="kupacIme">
				<input type="text" name="kupacIme"  placeholder="Ime *" />
			</div>
			<div class="kupacPrezime">
				<input type="text" name="kupacPrezime"  placeholder="Prezime *" />
			</div>
			<div class="kupacEmail">
				<input type="text" name="kupacEmail" placeholder="Email *" />
			</div>
			<div class="kupacAdresa">
				<input type="text" name="kupacAdresa" placeholder="Adresa *" />
			</div>
			<div class="kupacBroj">
				<input type="text" name="kupacBroj" placeholder="K.br. *" />
			</div>
			<div class="kupacPostanskiBroj">
				<input type="text" name="kupacPostanskiBroj" placeholder="Postanski br. *" />
				</div>
			<div class="kupacMjesto">
				<input type="text" name="kupacMjesto" placeholder="Mjesto *" />
				</div>
			<div class="kupacDrzava">
				<input type="text" name="kupacDrzava" placeholder="Drzava *" />
				</div>
			<div class="kupacBrTelefona">
				<input type="text" name="kupacBrTelefona" placeholder="Broj telefona *" />
				</div>
			<div class="kupacNapomena">
				<textarea name="kupacNapomena" placeholder="Napomena"></textarea>
			</div>
			<div class="kupacCheckbox">
				<input class="checkboxUvjeti" type="checkbox" name="checkboxUvjeti">Dajem privolu za korištenje mojih podataka u poslovne svhre
			</div>
		</div>
		<div class="podaciZaDostavu">
		</div>
	</div>



    <div class="buttonsContainer">
		<a href="brojIgraca.php" class="buttonOdustani">
			NAZAD
		</a>

		<input class="buttonDalje" type="submit" name="buttonDalje" value="DALJE" disabled/>
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
	<input type="hidden" name="brojIgraca" value="<?php echo $_GET['brojIgraca'] ?>">
</form>


<?php include 'footer.php' ?>