# VK_main
VK_main is a sort of framework for your script, it will help you and make you save precious time. The time of copy/paste functions like "tablelenght" is over.


# Our goals

To provide a liste of useful functions for any resources.
Regrouping copy/pasted functions in one place.
Make functions as events, to be called from server.
That the community will add dozen of functions, to make it the most complete as possible.


# Functions list 
I didn't make all the functions, it's a community project and I don't know the authors

    drawNotification(text)
    displayHelpText(text)
    getClosestPlayer()
    getPlayers()
    drawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    f(n)
    localPed()
    try(f, catch_f)
    firstToUpper(str)
    tablelength(T)
    round(num, idp)
    stringstarts(String,Start)
    
# Use of functions

exports.vk_main:function_name(arguments)

# Example

exports.vk_main:drawNotification("Hello word") -- Will display "Hello world", in the bottom-left corner
