// ------------------------------------------------------------------------------------------- Écoute du NUI et lancement des intéractions JS | Listen NUI & start JS interactions
function menuInteractif(item)
{
var menu = $('.menuInteractif');
var command = item.command;

var element = $('.selectedMenu');
var dataAction = element.attr('data-action');

var thisIndex = $(".selectedMenu").index();
var newIndex = null;

if(command == "f6") // Ouverture et fermeture du menu | Opening and closing the menu
{menu.toggle();}
else if(command == "up")
{newIndex = thisIndex - 2;}
else if(command == "down")
{newIndex = thisIndex - 4;}
else if(command == "enter") // Validation de la commande du menu | Validating the menu command
{
if(typeof dataAction !== typeof undefined && dataAction !== false) // Si l' attribut "data-action" existe | If the "data-action" attribute exists
{sendData("listen_menu_interactif", {'action':dataAction});}

}
else if(command == "esc")
{menu.hide();}

if(newIndex != null) 
{$(".liMenu").eq(newIndex).addClass("selectedMenu").siblings().removeClass("selectedMenu");}

}

// ------------------------------------------------------------------------------------------- On envoit des données sur le LUA client | Data is sent to the client LUA
function sendData(nameEvent, data){
$.post("http://basemods/"+nameEvent, JSON.stringify(data), function(datab){
//console.log(datab);
});
}