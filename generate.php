<?php

include 'pdf/tcpdf.php';
include 'mailer/mailer.php';

$html = $_POST['html'];
$filename = rand(0, 10000) . '.pdf';

$tcpdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$tcpdf->SetMargins(10, 10, 10, 10);

$tcpdf->AddPage();
$tcpdf->writeHTML($html, true, false, false, false, '');
$tcpdf->Output(__DIR__ . $filename, 'F');

$emailResult = sendMailWithPdf(__DIR__, $filename);
