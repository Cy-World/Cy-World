$(function() {
    $(".roomjoin").each(function(i, box) {
        $(box).on("click", function() {
            $.get("http://cyworld.pgw.jp:1919/cyworld/JoinRoomServlet", {
                "roomid": $(this).attr("id")
            });
            // $.ajax({
            //     url:"http://cyworld.pgw.jp:1919/cyworld/JoinRoomServlet",
            //     data:{
            //         "roomid":$(this).attr("id")
            //     }
            // })
        })
    })
})
