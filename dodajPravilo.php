<?php


$dodajPravilo=$veza->prepare("insert into pravilo 
				(naziv, opis, tag, narudzbaId) values 
				(:naziv, 'Vaše dodano pravilo', 'custom', :narudzbaId");
        $dodajPravilo->bindParam(":naziv", $_POST['pravilo']);
        $dodajPravilo->bindParam(":narudzbaId", $_POST['idNarudzbe']);
        $dodajPravilo->execute();