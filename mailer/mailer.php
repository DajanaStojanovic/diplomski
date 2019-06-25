<?php

include 'PHPMailer.php';

function sendMailWithPdf($path, $filename) {
    $result = false;

    //recipient email details
    $mailTo = 'dajana.stojanovic994@gmail.com';
    $subject = "PDF";

    //from email details
    $fromMail = 'dajana.stojanovic994@gmail.com';
    $fromName = 'My APP';

    //email text
    $text = "Test";

    // Attachment location
    $file = $path . $filename;

    $mail = new PHPMailer;
    $mail->IsHTML(true);

    $mail->SetFrom($fromMail, $fromName);
    $mail->AddReplyTo($fromMail, $fromName);
    $mail->AddAddress($mailTo, $mailTo);

    $mail->Subject = $subject;
    $mail->MsgHTML($text);

    $mail->AddAttachment($file, $filename);

    if ($mail->Send()) {
        $result = true;
    }

    return $result;
}


function sendMail() {
    $result = false;

    //recipient email details
    $mailTo = 'dajana.stojanovic994@gmail.com';
    $subject = "Kontakt s Ultra HC stranice";

    //from email details
    $fromMail = $_POST['kupacEmail'];
    $fromName = $_POST['kupacIme'];

    $text = $_POST['kupacNapomena'];

    $mail = new PHPMailer;
    $mail->IsHTML(true);

    $mail->SetFrom($fromMail, $fromName);
    $mail->AddReplyTo($fromMail, $fromName);
    $mail->AddAddress($mailTo, $mailTo);

    $mail->Subject = $subject;
    $mail->MsgHTML($text);

    if ($mail->Send()) {
        $result = true;
    }

    return $result;
}