$(document).on('turbolinks:load', ()=>{
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class ="js-file" type="file" name="item[item_images_attributes][${index}][url]" id="item_item_images_attributes_${index}_url" data-index="${index}">
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" width="200" height="200" src="${url}">`;
    return html;
  }
  
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 画像選択時に複数画像が送信できるようにhtmlを挿入
  $('.FormItem__imagebox').on('change', '.js-file', function(e){
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.FormItem__imagebox').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  // 画像を削除
  $('.FormItem__imagebox').on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index');

    fileIndex.shift();
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    
    // 画像入力欄が0個にならないようにする
    if ($('.js-file').length == 0){
      $('.FormItem__imagebox').append(buildFileField(fileIndex[0]));
    };
  });
  // 商品出品画面で値段を入力すると販売手数料と利益が出力される
  $('#FormItem__price--form_val').on('change', function(){
    price = $(this).val();
    fee = Math.round(price * 0.1, 1);
    profit = price - fee;
    if (price < 300 || price.match(/[^0-9]/)){
      $(this).val("");
      $('.FormItem__price--fee_val').text("ー");
      $('.FormItem__price--profit_val').text("ー");
    }else{
      $('.FormItem__price--fee_val').text(`${fee}`);
      $('.FormItem__price--profit_val').text(`${profit}`);
    };
  });
});