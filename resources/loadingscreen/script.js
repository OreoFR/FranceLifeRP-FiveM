/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization.
*/

$("body").fadeOut(0);

VK.social.container = document.querySelector(".social");
if (VK.social.discord != "NONE") {
    let discord = document.createElement("div");
    discord.classList.add("item");
    discord.innerHTML = "<div class=\"content\"><img src=\"icon/discord.png\">" + VK.social.discord + "</div>";
    VK.social.container.appendChild(discord);
}



VK.music.howl = new Howl({
    src: VK.music.url,
    autoplay: true,
    loop: true,
    html5: true,
    volume: VK.music.volume || 1
});
VK.music.howl.play();

if (VK.music.title != "NONE") {
    document.querySelector(".music .title .label").innerHTML = VK.music.title;
} else {
    document.querySelector(".music .title").style.display = "none";
}

if (VK.music.submitedBy != "NONE") {
    document.querySelector(".music .submitedBy .label").innerHTML = VK.music.submitedBy;
} else {
    document.querySelector(".music .submitedBy").style.display = "none";
}

if (VK.info.logo != "NONE") {
    document.querySelector(".logo").innerHTML = "<img src=\"" + VK.info.logo + "\">";
} else {
    document.querySelector(".logo").style.display = "none";
}

if (VK.info.text != "NONE") {
    document.querySelector(".info .label").innerHTML = VK.info.text;
} else {
    document.querySelector(".info").style.display = "none";
}

if (VK.info.website != "NONE") {
    document.querySelector(".website .label").innerHTML = VK.info.website;
} else {
    document.querySelector(".website").style.display = "none";
}


if (VK.players.enable === true) {
    $.ajaxSetup({
        crossOrigin: true,
        proxy: "proxy.php"
    });
    $.getJSON("http://runtime.fivem.net/api/servers/", function (data) {
        for (var i = 0; i < data.length; i++) {
            if (data[i]['EndPoint'] == VK.info.ip) {
                VK.server = data[i].Data;
                if (VK.server.players.length > 1) {
                    document.querySelector(".onlinePlayers .label").innerHTML = VK.players.multiplePlayersOnline.replace("@players", VK.server.players.length);
                } else if (VK.server.players.length == 1) {
                    document.querySelector(".onlinePlayers .label").innerHTML = VK.players.onePlayerOnline;
                } else if (VK.server.players.length < 1) {
                    document.querySelector(".onlinePlayers .label").innerHTML = VK.players.noPlayerOnline;
                }
            }
        }
    });
} else {
    document.querySelector(".onlinePlayers").style.display = "none";
}

function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
}

VK.tips.change = function () {
    setTimeout(function () {
        let newPosition = Math.round(getRandomArbitrary(0, VK.tips.list.length - 1));
        while (newPosition == VK.tips.actual) {
            newPosition = Math.round(getRandomArbitrary(0, VK.tips.list.length - 1));
        }
        VK.tips.actual = newPosition;

        if (document.querySelector(".tip .label").innerHTML == VK.config.loadingSessionText) return;

        document.querySelector(".tip .label").innerHTML = VK.tips.list[VK.tips.actual];
        $(".tip .label").fadeIn(500);
        setTimeout(function () {
            $(".tip .label").fadeOut(500);
            VK.tips.change();
        }, VK.backgrounds.duration-500)
    }, 500)
    
}

VK.backgrounds.change = function() {
    setTimeout(function() {
        let newPosition = Math.round(getRandomArbitrary(0, VK.backgrounds.list.length-1));
        while (newPosition == VK.backgrounds.actual) {
            newPosition = Math.round(getRandomArbitrary(0, VK.backgrounds.list.length - 1));
        }
        VK.backgrounds.actual = newPosition;
        
        if (VK.backgrounds.way) {
            document.querySelector(".backgroundOne").style.background = "url(\"" + VK.backgrounds.list[VK.backgrounds.actual] +"\")"
            $(".backgroundTwo").fadeOut(VK.backgrounds.duration/3);
        } else {
            document.querySelector(".backgroundTwo").style.background = "url(\"" + VK.backgrounds.list[VK.backgrounds.actual] + "\")"
            $(".backgroundTwo").fadeIn(VK.backgrounds.duration/3);
        }
        VK.backgrounds.way = !VK.backgrounds.way;
        VK.backgrounds.change();
    }, VK.backgrounds.duration)
}

VK.backgrounds.change()

if (VK.tips.enable) {
    VK.tips.change();
} else {
    document.querySelector(".tip").style.display = "none";
}

// Color changes

document.querySelector(".social").style.borderLeft = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] +")";
document.querySelector(".social").style.borderRight = "5px solid rgb(" + VK.config.secondColor[0] + "," + VK.config.secondColor[1] + "," + VK.config.secondColor[2] + ")";
document.querySelector(".social").style.background = "linear-gradient(to right, rgba(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ", 0.3), rgba(" + VK.config.secondColor[0] + "," + VK.config.secondColor[1] + "," + VK.config.secondColor[2] + ", 0.3))";
document.querySelector(".music .title").style.borderLeft = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".music .submitedBy").style.borderLeft = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".website").style.borderLeft = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".info").style.borderRight = "5px solid rgb(" + VK.config.secondColor[0] + "," + VK.config.secondColor[1] + "," + VK.config.secondColor[2] + ")";
document.querySelector(".tip").style.borderLeft = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".progess-bar").style.border = "5px solid rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".progess-bar .progess").style.background = "rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".loading1").style.borderTopColor = "rgb(" + VK.config.firstColor[0] + "," + VK.config.firstColor[1] + "," + VK.config.firstColor[2] + ")";
document.querySelector(".loading2").style.borderTopColor = "rgb(" + VK.config.secondColor[0] + "," + VK.config.secondColor[1] + "," + VK.config.secondColor[2] + ")";
document.querySelector(".loading3").style.borderTopColor = "rgb(" + VK.config.thirdColor[0] + "," + VK.config.thirdColor[1] + "," + VK.config.thirdColor[2] + ")";

$("body").fadeIn(1000);