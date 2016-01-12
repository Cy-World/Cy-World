/*
  z-index
  cardadd:103
  card-tmp:102
  bg-overlay:100
*/
//------------------------------------------------------------------------------
//main
//------------------------------------------------------------------------------

var cardList = {

};
$(function() {
    //addbuttonがおされたときの処理
    $(".cardadd").each(addButtonEvent);
    //cardを追加せずにoverlayを切る
    $("#bg-overlay").on("click", function() {
        $("#bg-overlay").fadeOut();
        $("#card-input").fadeOut();
    });
});
//------------------------------------------------------------------------------
var cardlist= new cardlist();
function addButtonEvent(i, box) {
    $(box).on("click", function() {
        if (chkOverlayProcess()) { //overlayの処理中かチェック
            if ($("#bg-overlay").css("display") == "none") { //fadein
                $("#bg-overlay").fadeIn();
                $("#card-input").fadeIn();
            } else { //fadeout
                cardUpdate();
                var inputrow = $("#input-val").val();
                alert(inputrow);
                var input = encodeURI(inputrow);
                alert(input);
                $.ajax({
                    url: "http://cyworld.pgw.jp:1919/test/CardaddServlet",
                    data: { //サーバーにGETで渡す情報。渡す必要がなければ省略可。
                        "carddata": input
                    }
                }).done(function(data, textStatus, jqXHR) { //成功時の処理
                    alert(data.responseMessage);
                    var newCard = $("#card-tmp").clone().removeAttr("id");
                    newCard.find(".card-content p").append(data.responseMessage);
                    $("#main-content").append(newCard);
                });
                $("#bg-overlay").fadeOut();
                $("#card-input").fadeOut();
            }
        }
    });
}

function cardList(){
    this.cardlist={};
    function setCard(card){
        cardlist[card.key]=card;
    }
}
function card(key,data){
    this.key=key;
    this.data=data;
}

function cardUpdate(){//現在の部屋のカード一覧を取得
    $.ajax({
        url: "http://cyworld.pgw.jp:1919/test/CardShowServlet",
    }).done(function(data, textStatus, jqXHR) { //成功時の処理
        for(var key in data){
            cardlist.setCard(new card(key,data[key]));
        }
    });
}

//overlayのonoff処理中かどうかのチェック
function chkOverlayProcess() {
    return $("#bg-overlay").css('opacity') === 0 || $("#bg-overlay").css('opacity') == 1;
}
