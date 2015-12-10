/*
  z-index
  cardadd:103
  card-tmp:102
  bg-overlay:100
*/
//------------------------------------------------------------------------------
//main
//------------------------------------------------------------------------------
$("docment").ready(function() {
    //addbuttonがおされたときの処理
    $(".cardadd").each(function(i, box) {
        $(box).on("click", function() {
            //overlayの処理中かチェック
            if (chkOverlayProcess()) {
                //fadein
                if ($("#bg-overlay").css("display") == "none") {
                    $("#bg-overlay").fadeIn();
                    $("#card-input").fadeIn();
                    //fadeout
                } else {
                    $("#bg-overlay").fadeOut();
                    $("#card-input").fadeOut();
                    cardAdd();
                }
            }
        });
    });
    //notadd overlay off
    //cardを追加せずにoverlayを切る
    $("#bg-overlay").on("click", function() {
        $("#bg-overlay").fadeOut();
        $("#card-input").fadeOut();
    });
});
//------------------------------------------------------------------------------
function cardAdd(){
    var clone =$("#card-tmp").clone(true);
    clone.find("p").append($("#card-input").find("value").val());
    clone.paramMod();
    $("#main-content").append(clone);
}



//tmpcardドのをstorming部分に追加する
// function addCard(card) {
//     addText(card, 'input');
//     addText(card, 'Textarea');
//     paramMod(card);
//     $("#main-content").append(card);
// }
//
// //入力された文字を追加するcardへコピーする
// function addText(card, selecter) {
//     var selecet = card.find(selecter);
//     selecet.after(card.find(selecter).val());
//     selecet.remove();
// }

//cardのパラメータを追加修正
function paramMod(card) {
    card.addClass("col");
    card.addClass("s3");
    card.removeAttr("id"); //Duplicate measures
}

//overlayのonoff処理中かどうかのチェック
function chkOverlayProcess() {
    return $("#bg-overlay").css('opacity') === 0 || $("#bg-overlay").css('opacity') == 1;
}
