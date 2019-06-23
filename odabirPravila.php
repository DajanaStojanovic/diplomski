<?php
include 'konfiguracija.php';
include 'header.php';
// Check connection
if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$izraz = $veza->prepare("select * from polja_ploca where oblik_ploce=:oblikPloce");
$izraz -> bindParam(":oblikPloce", $_GET["oblikPloce"]);
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

$narudzba = $veza->prepare("select boja_ploce from narudzba where id=:id");
$narudzba -> bindParam(":id", $_GET["id"]);
$narudzba->execute();
$rezultatiNarudzba = $narudzba->fetchAll(PDO::FETCH_OBJ);

$pravila = $veza->prepare("select * from pravilo");
$pravila->execute();
$rezultatiPravila = $pravila->fetchAll(PDO::FETCH_OBJ);

if(isset($_POST["buttonDalje"])){


        header("location: pregledIgre.php?id=" . $_POST['idNarudzbe'] . "");
};

?>

<script>
    function dragstart_handler(ev) {
        ev.dataTransfer.setData("text/plain", ev.target.id);
        ev.dataTransfer.dropEffect = "move";
    }

    function dragover_handler(ev) {
        ev.preventDefault();
        ev.dataTransfer.dropEffect = "move"
    }

    function drop_handler(ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text/plain");
        ev.target.appendChild(document.getElementById(data));
    }

    function generatePdf() {
        var html = $('.ploca').html();
        $.ajax({
            method: "POST",
            url: "generate.php",
            data: {
                html: html
            },
            success: function () {
                alert('sent to mail');
            }
        });
    }
</script>

<div class="headerPages">
    <a href="index.php"><img alt="logo" src="images/logo.png" class="headerLogo" /></a>
    <img alt="board" src="images/plocaHeader.png" class="headerBoardPages" />
    <div class="titlePages">Odabir pravila</div>
</div>
<img alt="breadCrumbs" src="images/breadcrumbsOdabirPravila.png" class="breadCrumbs" />
<div class="pageText">Pravila na polja dodaješ tako što iz lijeve kolone klikneš na pravilo koje želiš, zadržiš klik i povučeš prema polju koji želiš. <br/>
Možeš dodati i vlastita pravila, ne moraš birati iz ponuđenih!<br />
Ako se i dalje ne snalaziš, pogledaj video upute:</div>
    <a href="brojIgraca.php" class="buttonVideo buttonActive">
            POGLEDAJ VIDEO UPUTE 
        </a>

<div class="dodajPravilaContainer">
    <div class="pravilaContainer">
        <p class="pravilaText">Ponuđena pravila: </p>
        <?php foreach ($rezultatiPravila as $p): ?>
            <p class="pravilo" id="p<?php echo $p->id ?>" draggable="true" ondragstart="dragstart_handler(event);"><?php echo $p->naziv ?>
                <input type="hidden" value="<?php echo $p->id ?>" name="praviloId">
            </p>
        <?php endforeach; ?>
    </div>
<?php foreach ($rezultatiNarudzba as $n):?>
    <div style="background-color: <?php echo $n->boja_ploce ?>;" class="ploca">
<?php endforeach; ?>
        <?php foreach ($rezultati as $r): ?>
            <div class="kucica" style="font-size: 100%; text-align: center; color: #fff; background-color: <?php echo $r->boja_pozadine ?> ; height: <?php echo $r->visina ?>%; width: <?php echo $r->sirina ?>%; top: <?php echo $r->x_kordinata ?>%; left: <?php echo $r->y_kordinata ?>%; position:absolute; transform: rotate(<?php echo $r->kut ?>deg);"
                <?php if ($r->dodavanje_pravila == true): ?>
                    id="target<?php echo $r->id ?>" ondrop="drop_handler(event);" ondragover="dragover_handler(event);"
                <?php endif; ?>>
                <input type="hidden" name="poljeId" value="<?php echo $r->id ?>">
            </div>
        <?php endforeach; ?>
    </div>
</div>



    <div class="buttonsContainer">
        <a href="brojIgraca.php" class="buttonOdustani">
            NAZAD
        </a>
    <form method="post" action="<?php echo $_SERVER["PHP_SELF"] ?>">
        <input class="buttonDalje buttonActive" type="submit" name="buttonDalje" value="DALJE" onclick="generatePdf()"/>

        <input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
        <input type="hidden" name="brojIgraca" value="<?php echo $_GET['brojIgraca'] ?>">
    </form>
    </div>
    <input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">

<script>

var cw = $('.ploca').width();
$('.ploca').css({
    'height': cw + 'px'
});




</script>
<?php include 'footer.php'?>