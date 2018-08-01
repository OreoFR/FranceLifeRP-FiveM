// ------------------------------------------------------------------------------------------- Effet compteur | Effect counter
function effetCompteur(element, valueFinale, vitesse)
{
var element = $(element);

$({countNum: element.text()}).animate(
{countNum: valueFinale},
{
duration: vitesse,
easing: 'linear',
step: function(){
element.text(Math.floor(this.countNum));
},
complete: function(){
element.text(this.countNum);
}
}
); 

}