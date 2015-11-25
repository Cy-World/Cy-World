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
  $("#cardadd").on("click", function() {
    //overlayの処理中かチェック
    if (chkOverlayProcess()) {
      //fadein
      if ($("#bg-overlay").css("display") == "none") {
        $("#bg-overlay").fadeIn();
        $("#card-tmp").fadeIn();
        //fadeout
      } else {
        var cardclone = $("#card-tmp").clone(true);
        $("#bg-overlay").fadeOut();
        $("#card-tmp").fadeOut();
        addCard(cardclone);
      }
    }
  });
  //notadd overlay off
  //cardを追加せずにoverlayを切る
  $("#bg-overlay").on("click", function() {
    $("#bg-overlay").fadeOut();
    $("#card-tmp").fadeOut();
  })
});
//------------------------------------------------------------------------------
//tmpcardドのcloneをstorming部分に追加する
function addCard(cardclone) {
  addText(cardclone, 'input');
  addText(cardclone, 'Textarea');
  paramMod(cardclone);
  $("#main-content").append(cardclone);[]
}

//入力された文字を追加するcardへコピーする
function addText(cardclone, selecter) {
  var selecet = cardclone.find(selecter);
  selecet.after(cardclone.find(selecter).val());
  selecet.remove();
}

//cardcloneのパラメータを追加修正
function paramMod(cardclone) {
  cardclone.addClass("col");
  cardclone.addClass("s3");
  cardclone.removeAttr("id"); //Duplicate measures
}

//overlayのonoff処理中かどうかのチェック
function chkOverlayProcess() {
  return $("#bg-overlay").css('opacity') == 0||$("#bg-overlay").css('opacity') == 1;
}
