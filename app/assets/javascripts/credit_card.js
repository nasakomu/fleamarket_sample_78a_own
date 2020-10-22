$(document).on('turbolinks:load', ()=>{
  $("#regist-form").submit( function() {
    var dispMsg = "<div class='loadingMsg'>" + "処理中…" + "</div>";
    if($("#loading").length == 0){
      $("body").append("<div id='loading'>" + dispMsg + "</div>");
    };
  });

  $("body").unload( function() {
    $("#loading").remove();
  });
});
