var terms = [
  `<img src="images/Ulrich.png" class="billeder">
    <p>
    <p class="instruktoer_title"> Ulrich kan kontaktes p&aring;:</p>
    mail: umf@aarhustech.dk<br> Telefon: 61987304
    </p><br>

    <img src="images/Karsten.png" class="billeder">
    <p>
    <p class="instruktoer_title">Karsten kan kontaktes p&aring;:</p>
    mail: krs@aarhustech.dk<br> Telefon: 22234565
    </p>
    <br />
    <img src="images/Simon.png" class="billeder" />
    <p>
    <p class="instruktoer_title">Simon kan kontaktes p&aring;:</p>
    mail: sas@aarhustech.dk<br> Telefon: 22234166
    </p>`,

  `Alt hvad du skal vide om skp finder du her: <img src="images/skpdatait.png" class="QR_kode"> <br><br> www.ats-skpdatait.dk 
   <br> <br> <br> Hvis du mangler noget bestiller du det her: <img src="images/skpinventar.png" class="QR_kode"> <br> <br> www.inventar.ats-skpdatait.dk
   <br> <br> <br> Du kan se en plan over skolen her: <img src="images/skpfindvej.png" class="QR_kode"><br><br> www.findvej.ats-skpdatait.dk`,

  `<p class="instruktoer_title">Servicedesk</p><br>Du kan henvende dig i Servicedesk for at få hjælp de mest almindelige problemer. Også hvis du har problemer med at logge. Servicedesk ligger på 3. sal i lokale AS318<br> <br> <br>  <br>
   <p class="instruktoer_title">Techdesk</p><br>Når du går på hovedforløb kan du bestille udstyr gennem inventar.ats-skpdatait.dk. De vil så finde dit udstyr frem og udlevere det. Techdesk er placeret på 2. sal på gangen med hovedforløbet i lokale AC206`,
];

function rotateTerm() {
  var ct = $("#rotate").data("term") || 0;
  $("#rotate")
    .data("term", ct == terms.length - 1 ? 0 : ct + 1)
    .html(terms[ct])
    .fadeIn()
    .delay(10000) //her styre man hvornår næste slide kommer
    .fadeOut(1000, rotateTerm); //her styrer man hvor langtid fade skal vare
}

// gør alle html færdig hentet før vores scipt køre
window.onload = rotateTerm;
