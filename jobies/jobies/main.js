$(function(){
  function sendFormData(value) {
    alert(value);
    $.ajax({
      url: '/search_service/search',
      type: 'POST',
      data: {
        searchTerm: value
      }
    });
  };


  $('.search_button').on('click', function(){
    var value = $('.main_search_bar').val();
    sendFormData(value);
  });

});