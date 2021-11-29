console.log("hello")
var i = 0; // vores tæller array
  var terms = [`<img src="Assets/images/Ulrich.png" class="billeder">
  <p>
    <p class="instruktoer_title"> Ulrich kan kontaktes p&aring;:</p> 
    mail: umfaarhustech.dk<br> Telefon: 61987304
  </p><br>
  
  <img src="Assets/images/Karsten.png" class="billeder">
  <p>
    <p class="instruktoer_title">Karsten kan kontaktes p&aring;:</p>
    nbspmail: krsaarhustech.dk<br> Telefon: 22234565
  </p>
  <br />
  <img src="Assets/images/Simon.png" class="billeder" />
  <p>
    <p class="instruktoer_title">Simon kan kontaktes p&aring;:</p>
    nbspmail: sas@aarhustech.dk<br> Telefon: 22234166
  </p>`,
  `Alt hvad du skal vide om skp finder du her: <br><br> www.ats - skpdatait.dk <br> <br> <br> Hvis du mangler noget bestiller du det her: <br> <br> www.inventar.ats - skpdatait.dk`,
  `test3`,
  ];
 
  function rotateTerm() {
    var ct = $("#rotate").data("term") || 0;
    $("#rotate")
      .data("term", ct == terms.length - 1 ? 0 : ct + 1)
      .html(terms[ct])
      .fadeIn()
      .delay(1000)
      .fadeOut(1000, rotateTerm);
  }
 
  // gør alle html færdig hentet før vores scipt køre
  window.onload = rotateTerm;
