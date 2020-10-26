$(document).on('turbolinks:load', ()=>{
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <label>
                      <i class="fas fa-camera-retro"></i>
                      <input class ="js-file" type="file" name="item[item_images_attributes][${index}][url]" id="item_item_images_attributes_${index}_url" data-index="${index}">
                    </label>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url) => {
    const html = `<div class="preview">
                    <img data-index="${index}" width="200" height="200" src="${url}">
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }
  
  // 画像挿入フォームのwidthをpreviewの数に応じて変化させる関数
  const resizeImageForm = ( ) =>{
    previewNum = $('.preview').length
    jsFileGroup = $('.js-file_group')
    if (previewNum % 3 == 1){
      jsFileGroup.css('width', '412px');
    }else if(previewNum % 3 == 2){
      jsFileGroup.css('width', '206px');
    }else if(previewNum == 0){
      jsFileGroup.css('width', '618px');
    }else if(previewNum % 3 == 0 ){
      jsFileGroup.css('width', '618px');
    };
  }

  resizeImageForm();
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  // 画像削除のためのチェックボックスを隠す
  $('.hidden-destroy').hide();

  // すでにデータベースに存在する画像のindexを配列で取得
  existFileIndex = [...Array(lastIndex)].map((_, i) => i)

  // 画像選択フォームを隠す
  // 商品編集画面で保存失敗時に、画像削除用チェックボックスをfalseにする
  $.each(existFileIndex, function(i){
    $(`div[class="js-file_group"][data-index="${i}"]`).hide();
    const hiddenCheck = $(`input[data-index="${i}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', false);
  });

  // 画像選択時に複数画像が送信できるようにhtmlを挿入
  $('.FormItem__imagebox').on('change', '.js-file', function(e){
    const targetIndex = $(this).parent().parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 既存の画像選択フォームを隠す
    $(this).parent().parent().hide();

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#previews').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    };
    resizeImageForm();
  });

  // 画像を削除
  $('.FormItem__imagebox').on('click', '.js-remove', function(){
    const targetIndex = $(this).prev().data('index');
    // 既存データを削除するためにチェックボックス(hidden)にチェックを入れる
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    fileIndex.shift();
    // 該当する.js-file_groupと#previewの削除
    $(`div[data-index="${targetIndex}"`).remove();
    $(`img[data-index="${targetIndex}"]`).parent().remove();
    // 画像入力欄が0個にならないようにする
    if ($('.js-file').length == 0){
      $('.FormItem__imagebox').append(buildFileField(fileIndex[0]));
    };
    resizeImageForm();
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

  // 商品編集画面遷移時に販売手数料、利益が出力されるようにする
  price = $('#FormItem__price--form_val').val();
  fee = Math.round(price * 0.1, 1);
  profit = price - fee;
  $('.FormItem__price--fee_val').text(`${fee}`);
  $('.FormItem__price--profit_val').text(`${profit}`);

  //商品詳細ページのサブ画像をクリックするとメイン画像に表示される
  $('.itemInfoBox__allImageBox__subImages').on('click', function(){
    let url = $(this).data('url');
    $('.itemInfoBox__mainImage').remove();
    let html = `<img class='itemInfoBox__mainImage' src='${url}'>`
    $('.itemInfoBox__itemName').after(html);
  });
});