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
                if ($("#bg-overlay").css("display") == "none") { //fadein
                    $("#bg-overlay").fadeIn();
                    $("#card-input").fadeIn();
                } else { //fadeout
                    var input=$("#input-val").val();
                    alert(input); //testcode
                    var requestObj = {
                        data: input
                    };
                    var requestJson = $.toJSON(requestObj);
                    alert(requestJson);
                    $.ajax({
                        type: "GET",
                        url: "http://cyworld.pgw.jp:1919/test/CardaddServlet",
                        data: {
                            carddata: requestJson
                        },
                        success: function(data) {
                            alert(data.responseMessage);
                            //$("#result").append(data.responseMessage);
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("リクエスト時になんらかのエラーが発生しました：" + textStatus + ":\n" + errorThrown);
                        }
                    });
                    $("#bg-overlay").fadeOut();
                    $("#card-input").fadeOut();
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
