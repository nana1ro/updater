// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require Chart.min
//= require bootstrap-sprockets
//= require bxslider
//= require_tree .

$(function(){
   $('.bxslider').bxSlider({
    	auto: true,
		speed: 2000,
		moveSlide: 1,
		pause: 4000,
		infiniteLoop: true,
		minSlides: 4,
		maxSlides: 4,
		moveSlides: 1,
		slideWidth: 200,
		autoHover: true,
		touchEnabled: false,
		responsive: true,
  });
});

$(function(){
	$('.about-image').fadeIn(1800);
});

$(function(){
	$('.acdn-icon').click(function(){
		if ($(this).hasClass('glyphicon-download')){
			$(this).removeClass('glyphicon-download');
 			$(this).addClass('glyphicon-upload');
 			$(this).parent('h3').removeClass('page-header');
		} else {
 			$(this).removeClass('glyphicon-upload');
 			$(this).addClass('glyphicon-download');
 			$(this).parent('h3').addClass('page-header');
 		};
 	});
});

$(window).on('load resize', function(){
    var height = $('.navbar').height()-50;
    $('body').css('padding-top', height);
});