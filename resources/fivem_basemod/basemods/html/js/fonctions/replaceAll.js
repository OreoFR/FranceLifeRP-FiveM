// ------------------------------------------------------------------------------------------- Création de la fonction replaceAll | Create function replaceAll
String.prototype.replaceAll = function(search, replacement){
var target = this;
return target.split(search).join(replacement);
};