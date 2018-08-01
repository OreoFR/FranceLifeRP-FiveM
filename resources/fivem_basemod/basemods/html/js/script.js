/*var el = "<div class='modelView1'><div class='bTitle'>Appuyez sur ~r~H~~ pour sortir ~b~votre camion~~ du garage</div></div>";
$('body').append(colorText(el));*/

// ------------------------------------------------------------------------------------------- Écoute du NUI et lancement des intéractions JS | Listen NUI & start JS interactions
window.onload = function(e){
window.addEventListener('message', function(event){ // NUI Callback

var item = event.data;
if(item.mod == "baseMods") // On regarde si l' appel est pour le baseMods | Whether the call is for "baseMods"
{

// ---------------------------------------------- Menu intéractif | Interactive Menu
if(item.type == "menuInteractif")
{menuInteractif(item);}

// ---------------------------------------------- Phase de connexion | Connection phase
if(item.type == "connexion")
{
// On charge les couleurs primaires sur les éléments | The primordial color is loaded onto the elements
var primaryColor = item.primaryColor;
$('.primaryColor').css({'background': primaryColor});

var secondaryColor = item.secondaryColor;
var style = $('<style>.selectedMenu{background: '+secondaryColor+';}</style>');
$('html > head').append(style);

// On regarde si les systèmes sont activés | We look at whether systems are enabled
var activateEat = item.activateEat;
if(activateEat == false)
{
$('.buttonEat').remove();
$('#eat_joueur').hide();
}

var avoirSoif = item.avoirSoif;
if(avoirSoif == false)
{
$('.buttonDrink').remove();
$('#drink_joueur').hide();
}

var activateWC = item.activateWC;
if(activateWC == false)
{
$('.buttonWC').remove();
$('#wc_joueur').hide();
}

// On déclare la devise monétaire | The currency money is declared
var devise = item.devise;

// On déclare la langue depuis le lua | We declare the language from the lua
if(item.langue == "FR")
{langue = FR;}
else
{langue = EN;}

// Affichage du menu
if(item.mainView == 1)
{$('.mainRP').hide();}
else
{$('.mainRP').show();}

$("#money").html(item.money);
if(item.money < 0) // Si on est pauvre | If one is poor
{
$("#money").addClass("danger");
$(".devisei").addClass("danger");
} 
else if(item.money >= 1000000) // Si on est riche | If one is rich
{
$("#money").addClass("gold");
$(".devisei").addClass("gold");
}

$(".devisei").html(devise);

$("#job").html(langue[item.job]);
if(item.job != 5) // Si on a un emploi
{$("#job").removeClass('sansEmploi').addClass('job'+item.job);} // On change l' icône du métier | Change icon of job 

// Soif
if(item.drink <= 10)
{$("#drink_joueur").addClass('danger');}
$("#drink_joueur").html(item.drink);

$("#eat_joueur").html(item.eat);
$("#wc_joueur").html(item.wc);

// On charge la langue sur tous les menus | The language is loaded on all menus
$('div[data-lang]').each(function(){
var dataLang = $(this).attr("data-lang");
$(this).html(langue[dataLang]);
});

}

// ---------------------------------------------- Ouverture du menu visuel RP | Open visual main RP
if(item.type == "openMenu")
{
$('.mainRP').toggle();
}

// ---------------------------------------------- Affichage d' une informationn | Display of information
if(item.type == "viewMsg")
{
$('.modelView1').remove(); // On supprime les messages précédents | We delete the previous messages

if(item.model == "zone")
{
var el = "<div class='modelView1'><div class='bTitle'>"+colorText(langue[item.text])+"</div></div>";
$('body').append(el);
setTimeout(function(){$('.modelView1').fadeOut(500, function(){$(this).remove();})}, 500)
//$('.mainRP').toggle(); // Pour tester les réactions client - serveur
}
else if(item.model == "mission")
{
$('.modelView2').remove(); // On supprime les messages précédents | We delete the previous messages
var el = "<div class='modelView2'><div class='bTitle'>"+colorText(langue[item.text])+"</div></div>";
$('body').append(el);
setTimeout(function(){$('.modelView2').fadeOut(500, function(){$(this).remove();})}, 5000)
}

}

// ---------------------------------------------- Modification d' une valeur du menu RP | Changin a menu item RP
if(item.type == "updateRP")
{
var element = item.element;
var calc = item.calc;
var value = item.value;
var valueActuelle = item.valueActuelle;

var elementActuelle = $('#'+element);

if(valueActuelle == "null")
{
if(calc == "-")
{var newValue = parseInt(elementActuelle.html()) - parseInt(value);}
else
{var newValue = parseInt(elementActuelle.html()) + parseInt(value);}
}
else
{var newValue = valueActuelle;}

if(newValue < 0)
{
elementActuelle.addClass('danger');
newValue = 0;
}
else if(newValue <= 10)
{elementActuelle.addClass('danger');}
else
{elementActuelle.removeClass('danger');}

elementActuelle.html(effetCompteur(elementActuelle, newValue, 500));

}

// ---------------------------------------------- Remise à 0 ou 100 d' une valeur du menu RP | Reset a menu item RP from 0 to 100
if(item.type == "updateResetRP")
{
var element = item.element;
var value = item.value;

var elementActuelle = $('#'+element);
elementActuelle.html(effetCompteur(elementActuelle, value, 500));
}

// ---------------------------------------------- On modifie le portefeuille du joueur (argent ou argent sale)
if(item.type == "moneyChange")
{

if(item.typeMoney == 1) // Si c' est de l' argent propre
{
var montantActuel = $("#money").html();
if(item.addDim == "+")
{var calcMontant = parseInt(montantActuel) + parseInt(item.montant);}
else
{var calcMontant = parseInt(montantActuel) - parseInt(item.montant);}

$("#money").html(effetCompteur($("#money"), calcMontant, 500));

if(calcMontant < 0) // Si on est pauvre | If one is poor
{
$("#money").addClass("danger");
$(".devisei").addClass("danger");
} 
else if(item.money >= 1000000) // Si on est riche | If one is rich
{
$("#money").addClass("gold");
$(".devisei").addClass("gold");
}
else
{
$("#money").removeClass("gold danger");
$(".devisei").removeClass("gold danger");
}

}

// Si on enlève de l' argent au joueur ou si on en ajoute
if(item.addDim == "+")
{var addDim = "good";}
else
{var addDim = "danger";}

var el = "<div class='interactionMoney'><div class='interactionMoneyi "+addDim+"'>"+item.addDim+" "+item.montant+" "+devise+"</div></div>";
$('body').append(el);

setTimeout(function(){$('.interactionMoney').fadeOut(500, function(){$(this).remove();})}, 5000)

}

}
})
}