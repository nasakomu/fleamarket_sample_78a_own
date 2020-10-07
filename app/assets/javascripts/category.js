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
});