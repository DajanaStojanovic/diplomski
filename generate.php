<?php

require_once 'dompdf/autoload.inc.php';
include 'mailer/mailer.php';

use Dompdf\Dompdf;

$_POST = json_decode(file_get_contents('php://input'), true);
$html = $_POST['html'];

$filename = 'narudzbaId' . $_POST['idNarudzbe'] . '.pdf';

$dompdf = new Dompdf();
$dompdf->set_option('defaultFont', 'Courier');
$dompdf->load_html($html, 'UTF-8');
$dompdf->set_paper(array(0, 0, 2551, 2551), 'portrait');
$dompdf->set_base_path(__DIR__.'css/dompdf.css');
$dompdf->render();
$output = $dompdf->output();
file_put_contents(__DIR__ .'/pdfUploads/'.$filename, $output);


$emailResult = sendMailWithPdf(__DIR__, $filename);

?>