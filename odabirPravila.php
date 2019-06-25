<?php
include 'konfiguracija.php';
include 'header.php';

include 'dompdf/src/Dompdf.php';
include 'mailer/mailer.php';
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

$pravila = $veza->prepare("select * from pravilo where tag='default'");
$pravila->execute();
$rezultatiPravila = $pravila->fetchAll(PDO::FETCH_OBJ);

if($_POST){
    $filename = 'narudzbaId' . $_POST['idNarudzbe'] . '.pdf';
    $updateNaraudzba=$veza->prepare("update narudzba set
        pdf=:pdf
        where id=:id");
        $updateNaraudzba->bindParam(":pdf", $filename);
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();
    header("location: pregledIgre.php?id=" . $_POST['idNarudzbe'] . "");

};

if(isset($_POST["buttonOdustani"])) {
    $updateNaraudzba=$veza->prepare("delete from narudzba
        where id=:id");
        $updateNaraudzba->bindParam(":id", $_POST['idNarudzbe']);
        $updateNaraudzba->execute();

        header("location: index.php");
};

?>

<script>

    function dragstart_handler(ev) {
        ev.dataTransfer.setData("text/plain", ev.target.id);
        ev.dataTransfer.dropEffect = "move";


        var clone = event.target.cloneNode(true);
        event.target.parentNode.appendChild(clone);
        event.target.ghostDragger = clone;//SET A REFERENCE TO THE HELPER
        //return true;
    }

    function dragstart_handler_kucica(ev) {
        ev.dataTransfer.setData("text/plain", ev.target.id);
        ev.dataTransfer.dropEffect = "move"

        console.log(event);

    }

    function dragover_handler(ev) {
        ev.preventDefault();
        ev.dataTransfer.dropEffect = "move"
    }

    function drop_handler(ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text/plain");
        ev.target.appendChild(document.getElementById(data));

        $('.kucica .pravilo').removeAttr('ondragstart');
    }

    function noAllowDrop(ev) {
        ev.stopPropagation();
    }

    function generatePdf() {
        var html = JSON.stringify( {'html': $('.ploca')[0].outerHTML, 'idNarudzbe': $('input[name=idNarudzbe]').val() } );

        $.ajax({
            method: "POST",
            url: "generate.php",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            cache: false,
            data: html,
            complete: function(){
                $('#formPregledIgre').submit();
            }
        });
    }

        $(document).ready(function () {
            $(".buttonDodaj").click(function (e) {
                var pravilo = $("input[name='customPravilo']").val();
                var idNarudzbe = $("input[name='idNarudzbe']").val();
                $.post("", { pravilo: pravilo, idNarudzbe: idNarudzbe }, function (data) {
                    var insertedData = $('<p class="pravilo" id="pdodano'+ pravilo + '" ondragover="noAllowDrop(event);" draggable="true" ondragstart="dragstart_handler(event);"></p>').text(pravilo);
                    $(".buttonDodaj").after(insertedData);
                    $("form")[0].reset();
                });
                return false;
            });
        });
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
    <div class="pravilaContainer" ondragover="dragover_handler(event);" ondrop="drop_handler(event);" >
        <p class="pravilaText">Ponuđena pravila: </p>
        <?php foreach ($rezultatiPravila as $p): ?>
            <p class="pravilo" id="p<?php echo $p->id ?>" ondragover="noAllowDrop(event);" draggable="true" ondragstart="dragstart_handler(event);"><?php echo $p->naziv ?>
                <input type="hidden" value="<?php echo $p->id ?>" name="praviloId">
            </p>
        <?php endforeach; ?>
    </div>
<?php foreach ($rezultatiNarudzba as $n):?>
    <div style="background-color: <?php echo $n->boja_ploce ?>;" class="notHidden ploca">
<?php endforeach; ?>
        <?php foreach ($rezultati as $r): ?>
            <div class="kucica" style="text-align: center; color: #fff; background-color: <?php echo $r->boja_pozadine ?> ; height: <?php echo $r->visina ?>%; width: <?php echo $r->sirina ?>%; top: <?php echo $r->x_kordinata ?>%; left: <?php echo $r->y_kordinata ?>%; position:absolute; transform: rotate(<?php echo $r->kut ?>deg);"
                <?php if ($r->dodavanje_pravila == true): ?>
                    id="target<?php echo $r->id ?>" draggable="false" ondrop="drop_handler(event);" ondragover="dragover_handler(event);"
                <?php endif; ?>>
                <input type="hidden" name="poljeId" value="<?php echo $r->id ?>">
            </div>
        <?php endforeach; ?>
    </div>
    <form id="dodajPravilo" method="post" class="dodajPraviloContainer">
        <div>
            <p>Dodaj svoje pravilo</p>
            <input type="text" class="customPravilo" name="customPravilo" placeholder="Upiši svoje pravilo" />
            <p>Pravilo smije sadržavat maksimalno 30 znakova</p>
        </div>
                <input class="buttonDodaj" type="submit" name="buttonDodaj" value="DODAJ" disabled />

                <input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
            </form>
</div>
    <div class="buttonsContainer">
         
    <form id="formPregledIgre" method="post" action="<?php echo $_SERVER["PHP_SELF"] ?>">
        <input class="buttonOdustani" type="submit" name="buttonOdustani" value="ODUSTANI" />
        
        <input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">
        <input type="hidden" name="brojIgraca" value="<?php echo $_GET['brojIgraca'] ?>">
    </form>
        <input class="buttonDalje buttonActive" type="submit" name="buttonDalje" value="DALJE" />
    </div>
    <input type="hidden" name="idNarudzbe" value="<?php echo $_GET['id'] ?>">

<script>

var cw = $('.notHidden').width();
$('.notHidden').css({
    'width': cw + 'px',
    'height': cw + 'px',
});


$('.buttonActive').on('click', function() {
    $(".ploca").clone().appendTo("body");
    $('.ploca').addClass('hiddenPloca');
    $('.hiddenPloca').removeClass('notHidden');
    $(".hiddenPloca").css("height", "87cm");
    $(".hiddenPloca").css("width", "87cm");
    $(".hiddenPloca .kucica").css("color", "#000");
    $(".hiddenPloca .kucica").css("font-size", "40px");
   generatePdf();
});

$('body').on('click', '.kucica .pravilo', function(e) {
    $(this).remove();
});

$("input[name='customPravilo']").on("keyup", function(){
    if($(this).val() != "" == true){
        $(".buttonDodaj").removeAttr("disabled");
        $('.buttonDodaj').addClass('buttonActiveDodaj');
    }
});

$("input[name='customPravilo']").on("change", function(){
    if($(this).val() != "" == true){
        $(".buttonDodaj").removeAttr("disabled");
        $('.buttonDodaj').addClass('buttonActiveDodaj');
    }
});

$("input[name='customPravilo']").on("keyup", function(){
    if($(this).val().length > 30 == true){
        $(".buttonDodaj").attr("disabled","disabled");
        $('.buttonDodaj').removeClass('buttonActiveDodaj');
    }
});

$("input[name='customPravilo']").on("change", function(){
    if($(this).val().length > 30 == true){
        $(".buttonDodaj").attr("disabled","disabled");
        $('.buttonDodaj').removeClass('buttonActiveDodaj');
    }
});

$('.buttonDodaj').on('click', function() {
    $(".buttonDodaj").attr("disabled","disabled");
    $('.buttonDodaj').removeClass('buttonActiveDodaj');
});

</script>
<?php include 'footer.php'?>