// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('ready page:load',function(){

  $(".btn_tags").click(function(){
    $(this).toggleClass("btn-warning");
    $(this).toggleClass("btn-default");
    $(this).blur();
    submitTags();
  });

  $("#add_post_tag").click(function(){
    addTag();
  });

  $("#new_post_tag").keyup(function(e){
    if(e.which == 13){
      addTag(); 
    }
  });

  $(".btn_categories").click(function(){
    $(this).toggleClass("btn-primary");
    $(this).toggleClass("btn-default");
    $(this).blur();
    submitCategory();
  });

  $("#add_post_category").click(function(){
    addCategory();
  });

  $("#new_post_category").keyup(function(e){
    if(e.which == 13){
      addCategory(); 
    }
  });

  $('#finder').on('click','#close_search', function(){
    $('#search_results').html("");
    $('#input_finder').val("");
    $('#btn_finder').attr('disabled', false);
    this.remove();
  })
});

var submitTags = function(){
  var tags = []
  // Crea un array de las tags
  $(".btn_tags.btn-warning").each(function(){
    tags.push($(this).text());
  });
  var url = $("form").attr("action");
  $.ajax({
    type:"patch", 
    url: url + ".js", 
    data: {post:{tag_list: tags.join()}}
  });
}

var addTag = function(){
  var tag = $("#new_post_tag").val();
  var btn = "<button class='btn btn-sm btn-warning btn_tags'>" + tag + "</button>";
  $("#tags_div").append(btn);
  $("#new_post_tag").val("");
  submitTags();
}

var submitCategory = function(){
  var categories = []
  // Crea un array de las categorias
  $(".btn_categories.btn-primary").each(function(){
    categories.push($(this).text());
  });
  var url = $("form").attr("action");
  $.ajax({
    type:"patch",
    url: url + ".js",
    data: {post:{category_list: categories.join()}}
  });
}

var addCategory = function(){
  var cat = $("#new_post_category").val();
  var btn = "<button class='btn btn-sm btn-primary btn_categories'>" + cat + "</button>";
  $("#categories_div").append(btn);
  $("#new_post_category").val("");
  submitCategory();
}
