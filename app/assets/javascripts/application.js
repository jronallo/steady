//= require jquery
//= require bootstrap

$(function () {
  $('#try_another').hide();
  $('#upload_btn').on('click', function(e){
    e.preventDefault();
    $('#try_another').show(1000);
    console.log('gets here');
    $('#upload_form').submit();
  });
  $('#upload_csv').on('click', function(e){
    $('#try_another').hide();
  });
});
