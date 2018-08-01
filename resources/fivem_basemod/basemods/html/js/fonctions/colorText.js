// ------------------------------------------------------------------------------------------- Colorisation du texte | HTML text colorization
function colorText(text)
{
text = text.replaceAll("~g~", "<font style='color: #67B90E;'>");
text = text.replaceAll("~b~", "<font style='color: #0DB1E0;'>");
text = text.replaceAll("~r~", "<font style='color: #D72E0D;'>");
text = text.replaceAll("~~", "</font>");

return text;
}