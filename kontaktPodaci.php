<?php include 'header.php';
include 'konfiguracija.php'; 
include 'mailer/mailer.php';

if(isset($_POST['buttonDalje'])) {
	function valid_email($email) {
	    return !!filter_var($email, FILTER_VALIDATE_EMAIL);
	}
		if( valid_email($_POST['kupacEmail']) ) {
			sendMail();
			header("location: zahvalaKontakt.php");
		} else {
			header("location: kontaktPodaci.php?error=email&ime=" . $_POST['kupacIme'] . "&email=" . $_POST['kupacEmail'] . "&poruka=" . $_POST['poruka'] . "");
		}	
}
?>

<div class="headerPages">
	<a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
	<img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
	<div class="titlePages">Pravila privatnosti</div>
</div>
<div class="staticneContainer">
	<div>
		<div class="staticMenu">
			<p><a href="pravilaPrivatnosti.php">Pravila privatnosti</a></p>
			<p><a href="impressum.php">Impressum</a></p>
			<p><a href="kontaktPodaci.php"><b>Kontakt podaci</b></a></p>
		</div>
	</div>

	<div class="staticForm">
		<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
			<div class="osnovniPodaci">
				<div class="kupacIme">
					<?php if(isset($_GET['ime'])) {
						echo '<input type="text" class="kupacImeInput" name="kupacIme" value="'.$_GET["ime"].'" />';
					} else {
						echo '<input type="text" class="kupacImeInput" name="kupacIme" placeholder="Ime *" />';
					}?>
				</div>
				<div class="kupacPrezime">
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

				<div class="kupacNapomena">
					<?php if(isset($_GET['poruka'])) {
						echo '<textarea name="poruka" placeholder="Poruka">'.$_GET["poruka"].'</textarea>';
					} else {
						echo '<textarea name="poruka" placeholder="Poruka"></textarea>';
					}?>
				</div>
				<div class="kupacCheckbox">
					<input class="checkboxUvjeti" name="checkboxUvjeti" id="styled-checkbox-1" type="checkbox" value="value1">
	   				<label for="styled-checkbox-1">Dajem privolu za korištenje mojih podataka u poslovne svhre</label>  
				</div>
			</div>
				<div class="buttonsContainer">
					<input class="buttonDalje" type="submit" name="buttonDalje" value="POŠALJI" disabled/>
				</div>	
		</form>
	</div>
	<div>
			<p>Ured:</p>
			<p>Ultra HC d.o.o</p>
			<p>Vladimira Nazora 13</p>
			<p>Osijek, 31000</p>
			<p>E-mail: <a href="mailto: info@ultra-hc.com" class="mailKontakt">info@ultra-hc.com</a>
		</div>
</div>

<script type="text/javascript">
$("input[type='text']").on("keyup", function(){
    if($(".kupacImeInput").val() != "" 
    	&& $(".kupacEmail").val() != "" 
    	&& $("input[name='checkboxUvjeti']").is(":checked") == true){
        $(".buttonDalje").removeAttr("disabled");
        $('.buttonDalje').addClass('buttonActive');
    }else {
    	$(".buttonDalje").addAttr("disabled");
        $('.buttonDalje').removeClass('buttonActive');
    }
});

	$("input[name='checkboxUvjeti']").on("change", function(){
    if($(this).val() != "" && $(".kupacImeInput").val() != "" 
    	&& $(".kupacPrezimeInput").val() != ""  == true){
        $(".buttonDalje").removeAttr("disabled");
        $('.buttonDalje').addClass('buttonActive');
    }
});
</script>
<?php include 'footer.php' ?>