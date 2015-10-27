// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require select2
//= require jquery-ui
//= require common
//= require modernizr
//= require main
//= require posts
//= require twitter/bootstrap
//= require owl.carousel
//= require turbolinks
//= require vendor_js
//= require_tree .


// $(document).on('ready page:load', function() {


// $(document).ready(function() {
//   $("#datepicker").datepicker({
//     showOn: "button",
//     buttonImage: "images/calendar.gif",
//     buttonImageOnly: true,
//     buttonText: "Select date"
//   });
//   console.log("text");
// });
//$.rails.allowAction = $.lazybox.confirm;

// $(document).on('page:fetch', function() {
//  return $.lazybox("<i class='icon-orange'></i>", {
//    klass: 'spinner',
//    close: false,
//    esc: false
//  });
// });

// $(document).ready(function() {
//   $("select#team_select").select2({
//     placeholder: "Select a Team"
//   });
// });

// $(document).ready(function() {
//   $("select#objective_select").select2({
//     placeholder: "Select a Objective"
//   });
// });


// $('ul.nav > li').click(function (e) {
//     e.preventDefault();
// });

$(document).on('page:change', function() {
	$(".dropdown").hover((function() {
    	$(this).children(".sub-menu").slideDown(200);
  	}), function() {
    	$(this).children(".sub-menu").slideUp(200);
  	});

	$('#user_dob').datepicker({
		dateFormat: 'dd-mm-yy'
	});
});

// $(document).ready(function() {
//   $( "#sprint-detail" )
//     .accordion({
//       header: "div"
//     })
//     .sortable({
//       axis: "y",
//       handle: "div",
//       stop: function( event, ui ) {
//         // IE doesn't register the blur when sorting
//         // so trigger focusout handlers to remove .ui-state-focus
//         ui.item.children( "div" ).triggerHandler( "focusout" );

//         // Refresh accordion to handle new order
//         $( this ).accordion( "refresh" );
//       }
//     });
// });

// $(document).ready(function(){
//   $('#datepicker').datepicker({
//     changeMonth: true,
//     changeYear: true   
//   });
//   $('#datepicker').datepicker('option', 'dateFormat', 'yy-mm-dd');
// });

  // your code here
// });
