$(document).ready(function () {
	var slider1 = $("#lightSlider").lightSlider({
		item: 3,
		auto: true,
		loop: true,
		slideMove: 1,
		slideMargin: 30,
		controls: false,
		speed: 1000,
		pause: 5000,
		responsive: [
			{
				breakpoint: 992,
				settings: {
					item: 2,
					slideMove: 1,
				}
			},
			{
				breakpoint: 520,
				settings: {
					item: 1,
					slideMove: 1
				}
			}
		]
	});

	$('#goToPrevSlide1').on('click', function () {
		slider1.goToPrevSlide();
	});
	$('#goToNextSlide1').on('click', function () {
		slider1.goToNextSlide();
	});

	var slider2 = $('#recommendations').lightSlider({
		item: 3,
		auto: true,
		loop: true,
		slideMove: 1,
		slideMargin: 30,
		controls: false,
		speed: 1000,
		pause: 5000,
		responsive: [
			{
				breakpoint: 992,
				settings: {
					item: 2,
					slideMove: 1,
				}
			},
			{
				breakpoint: 520,
				settings: {
					item: 1,
					slideMove: 1
				}
			}
		]
	});

	$('#goToPrevSlide2').on('click', function () {
		slider2.goToPrevSlide();
	});
	$('#goToNextSlide2').on('click', function () {
		slider2.goToNextSlide();
	});

	$('.navbar-nav li a[href="/' + location.pathname.split("/")[1] + '"]').addClass('active');

	// Applied globally on all textareas with the "autoExpand" class
	$.each($('textarea[data-autoresize]'), function() {
	var offset = this.offsetHeight - this.clientHeight;

	var resizeTextarea = function(el) {
		$(el).css('height', 'auto').css('height', el.scrollHeight + offset);
	};
	$(this).on('keyup input', function() { resizeTextarea(this); }).removeAttr('data-autoresize');
	});
});
