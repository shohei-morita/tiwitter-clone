$(function(){
  $("#input-text").on("keyup", function() {
    let countMax = 140;
    let countNum = String($(this).val().length);
    let countDown = (countMax) - (countNum);
    $("#counter").text("残り" + countDown + "文字");

    if(countDown <= 10) {
      $("#counter").css({color: "#ff0000", fontWeight: "bold"});
    } else {
      $("#counter").css({color: "#000000", fontWeight: "nomal"});
    };
});
});
