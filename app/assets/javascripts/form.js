$(function(){
  var countMax = 140;
  var text = $('#input-text').val().length;
  var countDown = (countMax) - (text);
  $('#counter').html('残り' + countDown + '文字');

  $('#input-text').on('keydown', function() {
    var text = String($(this).val().length);
    var countDown = (countMax) - (text);
    $('#counter').text('残り' + countDown + '文字');

    if(countDown <= 10) {
      $('#counter').css({color: '#ff0000', fontWeight: 'bold'});
    } else {
      $('#counter').css({color: '#000000', fontWeight: 'nomal'});
    };
  });
});
