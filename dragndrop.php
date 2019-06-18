<?php
include 'konfiguracija.php';

// Check connection
if($veza === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$izraz = $veza -> prepare("select * from polja_ploca where oblik_ploce=1");
$izraz -> execute();
$rezultati = $izraz -> fetchAll(PDO::FETCH_OBJ);

$pravila = $veza -> prepare("select * from pravilo");
$pravila -> execute();
$rezultatiPravila = $pravila -> fetchAll(PDO::FETCH_OBJ);
?>


<script>

function dragstart_handler(ev) {
 // Add the target element's id to the data transfer object
 ev.dataTransfer.setData("text/plain", ev.target.id);
 ev.dataTransfer.dropEffect = "move";
}
function dragover_handler(ev) {
 ev.preventDefault();
 // Set the dropEffect to move
 ev.dataTransfer.dropEffect = "move"
}
function drop_handler(ev) {
 ev.preventDefault();
 // Get the id of the target and add the moved element to the target's DOM
 var data = ev.dataTransfer.getData("text/plain");
 ev.target.appendChild(document.getElementById(data));
}
</script>
<body>
 <p id="p1" draggable="true" ondragstart="dragstart_handler(event);">This element is draggable.</p>
 <div id="target" ondrop="drop_handler(event);" ondragover="dragover_handler(event);">Drop Zone</div>
</body>
<html>

<head>
	<title>Ultra HC - diplomski </title>
</head>





















</html>