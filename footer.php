<div class="footerContainer">
	<a href="pravilaPrivatnosti.php" class="pravilaFooter">Pravila privatnosti</a>
	<a href="impressum.php" class="impressumFooter">Impressum</a>
	<a href="kontaktPodaci.php" class="kontaktFooter">Kontakt podaci</a>

	<p class="footerText">Prilagodba sadržaja korisničkim zahtjevima u kontekstu nakladničkog procesa na primjeru društvene igre, diplomski rad. Dajana Stojanović, 2019.</p> 
</div>

<script>
jQuery(document).ready(function(){
    jQuery('.selectContainer').click(function(event){
        jQuery('.active').removeClass('active');
        jQuery(this).addClass('active');   
        event.preventDefault();
    });
});

$('div.selectContainer').on('click', function() {
  $(this).children('input').prop('checked', !$(this).children('input').prop('unchecked'));
  $('.buttonDalje').addClass('buttonActive');
  $('.buttonDalje').removeAttr('disabled');
});

//Color Picker
var colorPicker = new iro.ColorPicker("#color-picker-container", {
width: 280,
color: "#B2B2B2",
borderWidth: 1,
borderColor: "#fff",
});

var values = document.getElementById("values");
colorPicker.on(["color:init", "color:change"], function(color){
values.innerHTML = [
"<input type='hidden' name='bojaPloce' value='" + color.hexString + "'>"
];
document.getElementById("boardImage").style.backgroundColor = color.hexString;
});






</script>
</body>
</html>