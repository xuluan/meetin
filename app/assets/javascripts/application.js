// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(document).ready(function() {
$('input, textarea').placeholder();
/*$('.EA-label-hover').mouseover(
    function(){
    	$(this).find('p').css('display','block')
    });
$('.EA-label-hover').keyup(
    function(){
    	$(this).find('p').css('display','block')
    });
$('.EA-label-hover').mouseout(
    function(){
    	$(this).find('p').css('display','none')
    });
*/


$('.EA-label-hover').on("mouseover",
    function(){
    	$(this).find('p').css('display','inline')
    });
$('.EA-label-hover').on("mouseout",
    function(){
    	$(this).find('p').css('display','none')
    });

/*$('.EA-label-hover').off("mouseover",
    function(){
    	$(this).find('p').css('display','none')
    });*/

});