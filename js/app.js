$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});

	// sticky navbar
	if ($('.navbar-sticky').length) {
		var stickyToggle = function(sticky, stickyWrapper, scrollElement) {
			var stickyHeight = sticky.outerHeight();
			var stickyTop = stickyWrapper.offset().top;

			if (scrollElement.scrollTop() >= stickyTop) {
				stickyWrapper.height(stickyHeight);
				sticky.addClass("is-sticky");
			}
			else {
				sticky.removeClass("is-sticky");
				stickyWrapper.height('auto');
			}
		};

		// Find all data-toggle="sticky-onscroll" elements
		$('.navbar-sticky').each(function() {
			var sticky = $(this);
			var stickyWrapper = $('<div>').addClass('sticky-wrapper'); // insert hidden element to maintain actual top offset on page
			sticky.before(stickyWrapper);

			// Scroll & resize events
			$(window).on('scroll.sticky-onscroll resize.sticky-onscroll', function() {
				stickyToggle(sticky, stickyWrapper, $(this));
			});

			// On page load
			stickyToggle(sticky, stickyWrapper, $(window));
		});
	}

	// scroll to content button
	$('.js-scroll-to-content').click(function(e) {
		e.preventDefault();

		var $navbar = $('.navbar'),
			navbarHeight = $navbar.hasClass('navbar-sticky') ? $navbar.height() : 0;

		$('html, body').animate({
			scrollTop: $('.header').next().offset().top - navbarHeight
		}, 300, 'linear');
	});

	// favorites
	$('.js-favorites').click(function(e) {
		e.preventDefault();

		if ($(this).hasClass('btn-favorite--added'))
		{
			$(this).removeClass('btn-favorite--added');
		}
		else
		{
			$(this).addClass('btn-favorite--added');
		}
	});
});