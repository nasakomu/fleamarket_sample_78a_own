$(document).on('turbolinks:load', ()=>{
  $(".MyPage .SideBar .Nav__content").on({
    'mouseenter': function(){
      let icon =  $(this).find("i")
      $(this).css('background-color', '#fafafa');
      icon.css('right', '10px');
      icon.css('font-size', '24px');
      icon.css('color', '#555');
    },
    'mouseleave': function(){
      let icon =  $(this).find("i")
      $(this).css('background-color', '#fff');
      icon.css('right', '15px');
      icon.css('font-size', '20px')
      icon.css('color', '#ccc');
    },
    'click': function(){
      let icon =  $(this).find("i")
      $(this).css('background-color', '#fff');
      icon.css('right', '15px');
      icon.css('font-size', '20px')
      icon.css('color', '#ccc');
    }
  });
})