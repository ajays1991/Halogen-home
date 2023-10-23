jQuery(function($) {

	$(window).load(function(){
		$portfolio = $('.nino-portfolioItems');
		$portfolio.isotope({
			itemSelector : 'li',
			layoutMode : 'masonry'
		});

		$('#jobs-link').on('click', function(ev){
			window.location = "/jobs";
		});

		$('#home-link').on('click', function(ev){
			window.location = "/";
		});

		$('#contact-link').on('click', function(ev){
			window.location = "/contact";
		});

		$('#signin-link').on('click', function(ev){
			window.location = "/signin";
		});

		$('#product-link').on('click', function(ev){
			window.location = "/#product";
		});

		$('#team-link').on('click', function(ev){
			window.location = "/#team";
		});
	});	
});