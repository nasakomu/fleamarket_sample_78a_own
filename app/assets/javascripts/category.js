$(function() {
  //ヘッダーのカテゴリー表示
  function appendParentCategory(category){
    let html = `<a href="/categories/${category.id}" class="parent_nav_list" data-parent_id="${category.id}">${category.name}</a>`
    $('.parent_nav_box').append(html);
  }

  function appendChildCategory(child){
    let html = `<a href="/categories/${child.id}" class="child_nav_list" data-child_id="${child.id}">${child.name}</a>`
    $('.child_nav_box').append(html);
  }

  function appendgrandchildCategory(grandchild){
    let html = `<a href="/categories/${grandchild.id}" class="grandchild_nav_list" data-child_id="${grandchild.id}">${grandchild.name}</a>`
    $('.grandchild_nav_box').append(html);
  }
  //カテゴリーにマウスを合わせると親カテゴリーが表示される
  $('#category_nav').on('mouseover', function(){
    $.ajax({
      type: 'GET',
      url: '/categories',
      dataType: 'json'
    })
    .done(function(categories){
      $('.parent_nav_box').empty();
      categories.forEach(function(category){
        appendParentCategory(category);
      })
    })
    .fail(function(){
      alert('error');
    })
  });
  //親カテゴリーにマウスを合わせると子カテゴリーが表示される
  $(document).on('mouseover','.parent_nav_list', function(){
    let parent_id = $(this).data('parent_id');
    $.ajax({
      type: 'GET',
      url: '/categories/get_category_children',
      data: { parent_id: parent_id },
      dataType: 'json'
    })
    .done(function(children){
      $('.child_nav_box').empty();
      $('.grandchild_nav_box').empty();
      children.forEach(function(child){
        appendChildCategory(child);
      })
    })
    .fail(function(){
      alert('error');
    })
  });
  //子カテゴリーにマウスを合わせると孫カテゴリーが表示される
  $(document).on('mouseover','.child_nav_list', function(){
    let child_id = $(this).data('child_id');
    $.ajax({
      type: 'GET',
      url: '/categories/get_category_grandchildren',
      data: { child_id: child_id },
      dataType: 'json'
    })
    .done(function(grandchildren){
      $('.grandchild_nav_box').empty();
      grandchildren.forEach(function(grandchild){
        appendgrandchildCategory(grandchild);
      })
    })
    .fail(function(){
      alert('error');
    })
  });
  //表示削除用
  $('.header_main,.main_visual_section,.Strong_point_list,.category_list_wrapper,footer').on('mousemove', function(){
    $('.parent_nav_box').empty();
    $('.child_nav_box').empty();
    $('.grandchild_nav_box').empty();
  });
  $('.header_navs').on('mouseleave', function(){
    $('.parent_nav_box').empty();
    $('.child_nav_box').empty();
    $('.grandchild_nav_box').empty();
  });


// 商品出品ページのcategory表示
  // 挿入するHTMLの定義
  const buildChildForm = (() => {
    const html = `<dd class="FormItem__detail" id="Child__form">
                    <select required="required" class="Child__form--content" name="item[category_id]" id="item_category_id">
                      <option value="">選択してください</option>
                    </select>
                  </dd>`;
    $('#Parent__form').after(html);
  });

  const buildChildFormContent = ((child)=>{
    child.forEach(child =>{
      let content = `<option value="${child.id}">${child.name}</option>`
      $('.Child__form--content').append(content);
    });
  });

  const buildGrandChildForm = (()=>{
    const html = `<dd class="FormItem__detail" id="GrandChild__form">
                    <select required="required" class="GrandChild__form--content" name="item[category_id]" id="item_category_id">
                      <option value="">選択してください</option>
                    </select>
                  </dd>`;
    $('#Child__form').after(html);
  });

  const buildGrandChildFormContent = ((grandchild)=>{
    grandchild.forEach(grandchild =>{
      let content = `<option value="${grandchild.id}">${grandchild.name}</option>`
      $('.GrandChild__form--content').append(content);
    });
  });

  const buildSizeForm = (() =>{
    const html = `<div class="FormItem" id='Size__form'>
                    <dl>
                      <dt class="FormItem__label">
                        <label for="item_size">サイズ</label>
                          <span class="required">必須</span>
                      </dt>
                      <dd class="FormItem__detail">
                        <select required="required" name="item[size_id]" id="item_size_id" class='Size__form--content'>
                          <option value="">選択してください</option>
                        </select>
                      </dd>
                    </dl>
                  </div>`;
    $('#Category__form').after(html);
  });
  const buildSizeFormContent = ((size) =>{
    size.forEach(size => {
      const html = `<option value="${size.id}">${size.name}</option>`;
      $('.Size__form--content').append(html);
    });
  });
  // 親カテゴリー選択で子カテゴリーのFormが出現
  $('#Parent__form').on('change', function(){
    if ($('.Parent__form--content').val() == ''){
      $('#Child__form').remove();
      $('#GrandChild__form').remove();
      $('#Size__form').remove();
    } else{
      let parent_id = $('.Parent__form--content').val();
      $.ajax({
        url: '/categories/get_category_children',
        type: 'GET',
        data: {
          parent_id: parent_id
        },
        dataType: 'json'
      })
      .done(function(child){
        $('#Child__form').remove();
        $('#GrandChild__form').remove();
        $('#Size__form').remove();
        buildChildForm();
        buildChildFormContent(child);
      })
      .fail(function(){
        alert('error')
      })
    };
  });

  // 子カテゴリー選択で孫カテゴリーのFormが出現
  $(document).on('change','#Child__form', function(){
    if ($('.Child__form--content').val() == ''){
      $('#GrandChild__form').remove();
      $('#Size__form').remove();
    } else{
      let child_id = $('.Child__form--content').val();
      $.ajax({
        url: '/categories/get_category_grandchildren',
        type: 'GET',
        data: {
          child_id: child_id
        },
        dataType: 'json'
      })
      .done(function(grandchildren){
        // 孫カテゴリーが存在しない時表示されないようする分岐
        if (grandchildren.length == 0){
          $('#GrandChild__form').remove();
          $('#Size__form').remove();
        }else{
          $('#GrandChild__form').remove();
          $('#Size__form').remove();
          buildGrandChildForm();
          buildGrandChildFormContent(grandchildren)
        }
      })
      .fail(function(){
        alert('error')
      })
    };
  });
  // 孫カテゴリー選択でサイズフォームが出現する
  $(document).on('change','#GrandChild__form', function(){
    if ($('.GrandChild__form--content').val() == ''){
      $('#Size__form').remove();
    } else{
      let child_id = $('.Child__form--content').val();
      $.ajax({
        url: '/categories/get_size',
        type: 'GET',
        data: {
          child_id: child_id
        },
        dataType: 'json'
      })
      .done(function(size){
        $('#Size__form').remove();
        buildSizeForm();
        buildSizeFormContent(size);
      })
      .fail(function(){
        alert('error')
      })
    };
  });
});