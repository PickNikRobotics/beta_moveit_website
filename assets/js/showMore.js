$(document).ready(function () {
	$('.show-more-team').click(function () {
		$(this).parent().find('p').addClass('more');
		$(this).hide();
	});
});
