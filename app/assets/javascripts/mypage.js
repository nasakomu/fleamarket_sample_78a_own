$(document).on('turbolinks:load', ()=>{
  $(".MyPage .SideBar .Nav__content").hover(
    function(){
      let icon =  $(this).find("i")
      $(this).css('background-color', '#fafafa');
      icon.css('right', '10px');
      icon.css('font-size', '24px');
      icon.css('color', '#555');
    },
    function(){
      let icon =  $(this).find("i")
      $(this).css('background-color', '#fff');
      icon.css('right', '15px');
      icon.css('font-size', '20px')
      icon.css('color', '#ccc');
  });
})