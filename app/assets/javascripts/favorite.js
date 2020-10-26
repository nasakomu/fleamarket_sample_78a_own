$(document).on('turbolinks:load', ()=>{
  itemId = $(location).attr('pathname').replace("/items/", "");
  $(".favoriteBtn").on("click", function(){
    $.ajax({
      url: 'favorite',
      type: 'POST',
      data: {
        id: itemId
      },
      dataType: 'json'
    })
    .done(function(id){
      console.log(id);
    })
    .fail(function(){
      alert('error')
    })
  });
});