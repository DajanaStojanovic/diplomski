<?php include 'header.php' ?>
<?php include 'konfiguracija.php'; 

if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$izraz = $veza->prepare("select * from narudzba inner join broj_igraca on narudzba.broj_igraca=broj_igraca.id where narudzba.id=:id");
$izraz -> bindParam(":id", $_GET["id"]);
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){
	function valid_email($email) {
	    return !!filter_var($email, FILTER_VALIDATE_EMAIL);
	}
		if( valid_email($_POST['kupacEmail']) ) {
		    	$izraz=$veza->prepare("insert into narucitelj 
				(ime, prezime, email, adresa, kucni_broj, postanski_broj, mjesto, drzava, broj_telefona, napomena, privola) values 
				(:ime, :prezime, :email, :adresa, :kucni_broj, :postanski_broj, :mjesto, :drzava, :broj_telefona, :napomena, 1)");
		        $izraz->bindParam(":ime", $_POST['kupacIme']);
		        $izraz->bindParam(":prezime", $_POST['kupacPrezime']);
		        $izraz->bindParam(":email", $_POST['kupacEmail']);
		        $izraz->bindParam(":adresa", $_POST['kupacAdresa']);
		        $izraz->bindParam(":kucni_broj", $_POST['kupacBroj']);
		        $izraz->bindParam(":postanski_broj", $_POST['kupacPostanskiBroj']);
		        $izraz->bindParam(":mjesto", $_POST['kupacMjesto']);
		        $izraz->bindParam(":drzava", $_POST['kupacDrzava']);
		        $izraz->bindParam(":broj_telefona", $_POST['kupacBrTelefona']);
		        $izraz->bindParam(":napomena", $_POST['kupacNapomena']);
		        $izraz->execute();
		        $idZapis = $veza->lastInsertId();


		        $updateNaraudzba=$veza->prepare("update narudzba set
				narucitelj=:narucitelj, dostava=:dostava, placanje=:placanje, datum=:datum
				where id=:id");
		        $updateNaraudzba->bindParam(":narucitelj", $idZapis);
		        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
		        $updateNaraudzba->bindParam(":dostava", $_POST['nacinDostave']);
		        $updateNaraudzba->bindParam(":placanje", $_POST['placanje']);
		        $date=date("Y-m-d");
		        $updateNaraudzba->bindParam(":datum", $date);
		        $updateNaraudzba->execute();

				header("location: zahvala.php");
		        exit();
		} else {
			header("location: podaciZaDostavu.php?id=" . $_POST['idNarudzbe'] . "&error=email&ime=" . $_POST['kupacIme'] . "&prezime=" . $_POST['kupacPrezime'] . "&email=" . $_POST['kupacEmail'] . "&adresa=" . $_POST['kupacAdresa'] . "&kbr=" . $_POST['kupacBroj'] . "&postBr=" . $_POST['kupacPostanskiBroj'] . "&mjesto=" . $_POST['kupacMjesto'] . "&drzava=" . $_POST['kupacDrzava'] . "&brtel=" . $_POST['kupacBrTelefona'] . "&napomena=" . $_POST['kupacNapomena'] . "&dostava=" . $_POST['nacinDostave'] . "");
		}
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
				<?php if(isset($_GET['ime'])) {
					echo '<input type="text" class="kupacImeInput" name="kupacIme" value="'.$_GET["ime"].'" />';
				} else {
					echo '<input type="text" class="kupacImeInput" name="kupacIme" placeholder="Ime *" />';
				}?>
			</div>
			<div class="kupacPrezime">
				<?php if(isset($_GET['prezime'])) {
					echo '<input type="text" class="kupacPrezimeInput" name="kupacPrezime" value="'.$_GET["prezime"].'" />';
				} else {
					echo '<input type="text" class="kupacPrezimeInput" name="kupacPrezime" placeholder="Prezime *" />';
				}?>
			</div>
			<div class="kupacEmail">
				<?php if(isset($_GET['email'])) {
					echo '<input type="text" class="kupacEmailInput" name="kupacEmail" value="'.$_GET["email"].'" />';
				} else {
					echo '<input type="text" class="kupacEmailInput" name="kupacEmail" placeholder="Email *" />';
				}?>
				<span class="errorMessage">
					<?php 
						if(isset($_GET['error'])){
							$errorCheck = $_GET['error'];
							if ($errorCheck == "email") {
								echo "Email nije ispravan.";
								
							}
						};
				  ?></span>
			</div>
			<div class="kupacAdresa">
				<?php if(isset($_GET['adresa'])) {
					echo '<input type="text" class="kupacAdresaInput" name="kupacAdresa" value="'.$_GET["adresa"].'" />';
				} else {
					echo '<input type="text" class="kupacAdresaInput" name="kupacAdresa" placeholder="Adresa *" />';
				}?>
				
			</div>
			<div class="kupacBroj">
				<?php if(isset($_GET['kbr'])) {
					echo '<input type="text" class="kupacBrojInput" name="kupacBroj" value="'.$_GET["kbr"].'" />';
				} else {
					echo '<input type="text" class="kupacBrojInput" name="kupacBroj" placeholder="K.br. *" />';
				}?>
			</div>
			<div class="kupacPostanskiBroj">
				<?php if(isset($_GET['postBr'])) {
					echo '<input type="text" class="kupacPostanskiBrojInput" name="kupacPostanskiBroj" value="'.$_GET["postBr"].'" />';
				} else {
					echo '<input type="text" class="kupacPostanskiBrojInput" name="kupacPostanskiBroj" placeholder="Postanski br. *" />';
				}?>
				
			</div>
			<div class="kupacMjesto">
				<?php if(isset($_GET['mjesto'])) {
					echo '<input type="text" class="kupacMjestoInput" name="kupacMjesto" value="'.$_GET["mjesto"].'" />';
				} else {
					echo '<input type="text" class="kupacMjestoInput" name="kupacMjesto" placeholder="Mjesto *" />';
				}?>	
			</div>
			<div class="kupacDrzava">
				<?php if(isset($_GET['drzava'])) {
					echo '<input type="text" class="kupacDrzavaInput" name="kupacDrzava" value="'.$_GET["drzava"].'" />';
				} else {
					echo '<input type="text" class="kupacDrzavaInput" name="kupacDrzava" placeholder="Drzava *" />';
				}?>
				</div>
			<div class="kupacBrTelefona">
				<?php if(isset($_GET['brtel'])) {
					echo '<input type="text" class="kupacBrTelefonaInput" name="kupacBrTelefona" value="'.$_GET["brtel"].'" />';
				} else {
					echo '<input type="text" class="kupacBrTelefonaInput" name="kupacBrTelefona" placeholder="Broj telefona *" />';
				}?>
				</div>
			<div class="kupacNapomena">
				<?php if(isset($_GET['napomena'])) {
					echo '<textarea name="kupacNapomena" placeholder="Napomena">'.$_GET["napomena"].'</textarea>';
				} else {
					echo '<textarea name="kupacNapomena" placeholder="Napomena"></textarea>';
				}?>
			</div>
			<div class="kupacCheckbox">
				<input class="checkboxUvjeti" name="checkboxUvjeti" id="styled-checkbox-1" type="checkbox" value="value1">
   				<label for="styled-checkbox-1">Dajem privolu za korištenje mojih podataka u poslovne svhre</label>  
			</div>
		</div>
		<div class="podaciZaDostavu">
			<div>
				<?php if(isset($_GET['dostava']) && $_GET['dostava'] == 'dpd') {
					echo '<input type="radio" id="styled-checkbox-2" name="nacinDostave" class="checkboxUvjeti" value="dpd" checked>';
				} else {
					echo '<input type="radio" id="styled-checkbox-2" name="nacinDostave" class="checkboxUvjeti" value="dpd">';
				}?>
				<label for="styled-checkbox-2"><img src="images/dpd.png" class="dpdImage" alt="DPD">25 kn</label>  
			</div>
			<div>
				<?php if(isset($_GET['dostava']) && $_GET['dostava'] == 'tisak') {
					echo '<input type="radio" id="styled-checkbox-3" name="nacinDostave" class="checkboxUvjeti" value="tisak" checked>';
				} else {
					echo '<input type="radio" id="styled-checkbox-3" name="nacinDostave" class="checkboxUvjeti" value="tisak">';
				}?>
				<label for="styled-checkbox-3"><img src="images/tisak.png" class="tisakImage" alt="tisak">25 kn</label>  
			</div>
			<div>
				<?php if(isset($_GET['dostava']) && $_GET['dostava'] == 'overseasExpress') {
					echo '<input type="radio" id="styled-checkbox-4" name="nacinDostave" class="checkboxUvjeti" value="overseasExpress" checked>';
				} else {
					echo '<input type="radio" id="styled-checkbox-4" name="nacinDostave" class="checkboxUvjeti" value="overseasExpress">';
				}?>
				<label for="styled-checkbox-4"><img src="images/overseas.png" class="overseasImage" alt="overseas">25 kn</label>  
			</div>
			<div>
				<?php if(isset($_GET['dostava']) && $_GET['dostava'] == 'gls') {
					echo '<input type="radio" id="styled-checkbox-5" name="nacinDostave" class="checkboxUvjeti" value="gls" checked>';
				} else {
					echo '<input type="radio" id="styled-checkbox-5" name="nacinDostave" class="checkboxUvjeti" value="gls">';
				}?>
				<label for="styled-checkbox-5"><img src="images/gls.png" class="glsImage" alt="gls">25 kn</label>  
			</div>

			<div class="odabirNacinaPlacanja">
				<div class="nacinPlacanjaText">
					Odabir načina plaćanja
				</div>
				<input type="radio" id="styled-checkbox-6" name="placanje" class="checkboxUvjeti" value="Plaćanje pouzećem" checked>
				<label for="styled-checkbox-6">Plaćanje pouzećem</label>
			</div>

			<div class="pregledPlacanja">
				<div class="ultraHCIgra">
					<?php foreach ($rezultati as $r): ?>
						<div class="nazivIgre">
							<?php echo $r->naziv ?>
							<span><?php echo $r->cijena ?>kn
						</div>
				    <?php endforeach; ?>
					
				</div>

				<div class="dostava">
						<div class="dostavaIgre">
							Dostava
							<span>25.00kn
						</div>
				</div>

				<div class="ukupno">
						<div class="ukupnoIgre">
							Ukupno
							<span><?php 
							foreach ($rezultati as $r) {
								$x=$r->cijena;  
								$y=25.00;  
								$z=$x+$y;  
								echo $z,".00kn"; 
							} ?> 
						</div>
				</div>
			</div>
		</div>
	</div>
    <div class="buttonsContainer">
		<input class="buttonOdustani" type="submit" name="buttonOdustani" value="ODUSTANI" />

		<input class="buttonDalje" type="submit" name="buttonDalje" value="KUPI" disabled/>
	</div>
	<input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
</form>


<script type="text/javascript">
	$("input[type='text']").on("keyup", function(){
    if($(".kupacImeInput").val() != "" 
    	&& $(".kupacPrezimeInput").val() != "" 
    	&& $(".kupacEmailInput").val() != "" 
    	&& $(".kupacAdresaInput").val() != "" 
    	&& $(".kupacBrojInput").val() != "" 
    	&& $(".kupacPostanskiBrojInput").val() != "" 
    	&& $(".kupacMjestoInput").val() != "" 
    	&& $(".kupacDrzavaInput").val() != "" 
    	&& $(".kupacBrTelefonaInput").val() != "" 
    	&& $("input[name='nacinDostave']").is(":checked") 
    	&& $("input[name='checkboxUvjeti']").is(":checked") == true){
        $(".buttonDalje").removeAttr("disabled");
        $('.buttonDalje').addClass('buttonActive');
    }
});

	$("input[name='nacinDostave'], input[name='checkboxUvjeti']").on("change", function(){
    if($(this).val() != "" && $(".kupacImeInput").val() != "" 
    	&& $(".kupacPrezimeInput").val() != "" 
    	&& $(".kupacEmailInput").val() != "" 
    	&& $(".kupacAdresaInput").val() != "" 
    	&& $(".kupacBrojInput").val() != "" 
    	&& $(".kupacPostanskiBrojInput").val() != "" 
    	&& $(".kupacMjestoInput").val() != "" 
    	&& $(".kupacDrzavaInput").val() != "" 
    	&& $(".kupacBrTelefonaInput").val() != "" 
    	&& $("input[name='nacinDostave']").is(":checked") 
    	&& $("input[name='checkboxUvjeti']").is(":checked") == true){
        $(".buttonDalje").removeAttr("disabled");
        $('.buttonDalje').addClass('buttonActive');
    }
});
</script>

<?php include 'footer.php' ?>