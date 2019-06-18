<?php
include 'konfiguracija.php';

// Check connection
if ($veza === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$izraz = $veza->prepare("select * from polja_ploca where oblik_ploce=1");
$izraz->execute();
$rezultati = $izraz->fetchAll(PDO::FETCH_OBJ);

$pravila = $veza->prepare("select * from pravilo");
$pravila->execute();
$rezultatiPravila = $pravila->fetchAll(PDO::FETCH_OBJ);

?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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

<html>
<head>
    <title>Ultra HC - diplomski </title>
</head>

<body>
<div style="width: 33.3%; padding-top: 33.3%; background-color: #808000; position: relative;" class="ploca">
    <?php foreach ($rezultati as $r): ?>
        <div style="font-size: 100%; text-align: center; color: #fff; background-color: <?php echo $r->boja_pozadine ?> ; height: <?php echo $r->visina ?>%; width: <?php echo $r->sirina ?>%; top: <?php echo $r->x_kordinata ?>%; left: <?php echo $r->y_kordinata ?>%; position:absolute; transform: rotate(<?php echo $r->kut ?>deg);"
            <?php if ($r->dodavanje_pravila == true): ?>
                id="target<?php echo $r->id ?>" ondrop="drop_handler(event);" ondragover="dragover_handler(event);"
            <?php endif; ?>>
            <input type="hidden" name="poljeId" value="<?php echo $r->id ?>">
        </div>
    <?php endforeach; ?>
</div>
<div class="pravilaContainer">
    <?php foreach ($rezultatiPravila as $p): ?>
        <div class="pravilo" id="p<?php echo $p->id ?>" draggable="true"
             ondragstart="dragstart_handler(event);"><?php echo $p->naziv ?>
            <input type="hidden" value="<?php echo $p->id ?>" name="praviloId">
        </div>
    <?php endforeach; ?>
</div>
<button type="button" name="kreirajPDF" onclick="generatePdf()">Kreiraj PDF</button>
</body>
</html>