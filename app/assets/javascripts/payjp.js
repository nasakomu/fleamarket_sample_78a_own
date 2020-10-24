$(document).on('turbolinks:load', ()=>{

  Payjp.setPublicKey("pk_test_b8f8671c18b8abe265919ca5"); // PAY.JPテスト公開鍵
  const form = document.getElementById("regist-form");
  form.addEventListener("submit", (e) => {
    
    e.preventDefault();
  
    const formResult = document.getElementById("regist-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: formData.get("exp_year"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("regist-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");
      
      document.getElementById("regist-form").submit();
      document.getElementById("regist-form").reset();
    })
  })
});