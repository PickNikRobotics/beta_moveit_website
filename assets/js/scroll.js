$(document).ready(function () {
	var target = document.location.hash;
	if (target.length) {
		$('html, body').animate({
			scrollTop: $(target).offset().top - 500
		}, 1000);
		$(target).find('.collapses__link').click();
	}
});

$(window).on('scroll', () => {
	const scrollValue = $(window).scrollTop();
	if (scrollValue > 34) {
		$('.navbar').addClass('navbar--sticky');
	} else {
		$('.navbar').removeClass('navbar--sticky');
	}
});
