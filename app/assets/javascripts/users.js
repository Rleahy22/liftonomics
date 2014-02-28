$('document').ready(function(){
  var field = 2;
  $('.new_user div:nth-child(' + field + ')').show();
  $('.new_user div:nth-child(' + field + ') input').focus();

  $('.new_user input').on('keyup', function(e) {
    if (e.which == 13 || e.keyCode == 13) {
      $('.new_user div:nth-child(' + field + ')').hide();
      field++;
      $('.new_user div:nth-child(' + field + ')').show();
      $('.new_user div:nth-child(' + field + ') input').focus();
    }
  });

  $('.new_user select').on('change', function(e) {
    $('.new_user div:nth-child(' + field + ')').hide();
      field++;
    $('.new_user div:nth-child(' + field + ')').show();
    $('.new_user div:nth-child(' + field + ') input').focus();
  })
})