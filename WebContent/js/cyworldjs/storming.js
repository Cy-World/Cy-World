/*
  z-index
  cardadd:103
  card-tmp:102
  bg-overlay:100
*/
//------------------------------------------------------------------------------
//main
//------------------------------------------------------------------------------

var cardList = new CardList();
$(function() {
    cardUpdate();
    //関数cardUpdateを10秒間隔で呼び出す
    setInterval(cardUpdate, 1000);
    //addbuttonがおされたときの処理
    $(".cardadd").each(addButtonEvent);
    //cardを追加せずにoverlayを切る
    $("#bg-overlay").on("click", function() {
        $("#bg-overlay").fadeOut();
        $("#card-input").fadeOut();
    });
});
//------------------------------------------------------------------------------

function addButtonEvent(i, box) {
    $(box).on("click", function() {
        if (chkOverlayProcess()) { //overlayの処理中かチェック
            if ($("#bg-overlay").css("display") == "none") { //fadein
                $("#bg-overlay").fadeIn();
                $("#card-input").fadeIn();
            } else { //fadeout
                var inputrow = $("#input-val").val();
                var input = encodeURI(inputrow);
                $.ajax({
                    url: "http://cyworld.pgw.jp:1919/cyworld/CardaddServlet",
                    data: { //サーバーにGETで渡す情報。渡す必要がなければ省略可。
                        "carddata": input
                    }
                }).done(function(data, textStatus, jqXHR) { //成功時の処理
                    cardUpdate();
                });
                $("#bg-overlay").fadeOut();
                $("#card-input").fadeOut();
            }
        }
    });
}

function CardList() {
    this.cardList = {};
    this.setCard = function(card) {
        var key = String(card.key);
        if (!(card.key in this.cardList)) {
            this.cardList[key] = card;
            var newCard = $("#card-tmp").clone().removeAttr("id");
            newCard.find(".card-content p").append(card.data);
            $("#main-content").append(newCard);
        } else {
            this.cardList[key] = card;
        }
    };
}

function Card(key, data) {
    this.key = key;
    this.data = data;
}

function cardUpdate() { //現在の部屋のカード一覧を取得
    $.ajax({
        url: "http://cyworld.pgw.jp:1919/cyworld/CardShowServlet",
    }).done(function(data, textStatus, jqXHR) { //成功時の処理
        for (var key in data) {
            cardList.setCard(new Card(key, data[key]));
        }
    });
}

//overlayのonoff処理中かどうかのチェック
function chkOverlayProcess() {
    return $("#bg-overlay").css('opacity') === 0 || $("#bg-overlay").css('opacity') == 1;
}
