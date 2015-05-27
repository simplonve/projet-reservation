// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
	$('.input__field, .textarea').blur(function() {
		if ( $(this).val() != "" ) {
			$(this).next().addClass('filled');
		}
		else {
			$(this).next().removeClass('filled');
		}
	});
})
