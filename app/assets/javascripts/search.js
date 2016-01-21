var SEARCH = SEARCH || {}

SEARCH.clickButtonSearch = function(){
	$(".flaticon-house28").hide();
	$("#btn-search-opportunity").click(function(){
		if($(this).hasClass("button-search-disabled")){
			$(this).removeClass("button-search-disabled");
			$(this).addClass("button-search-enabled");
			$("#btn-search-ngo").addClass("button-search-disabled");
			$("#btn-search-ngo").removeClass("button-search-enabled");
			$("#form_search").attr('action','/opportunities');
			$(".border_search").css("border-radius", "0px 4px 4px 4px");
			$(".flaticon-palm1").show();
			$(".flaticon-house28").hide();
		}
	});

	$("#btn-search-ngo").click(function(){
		if($(this).hasClass("button-search-disabled")){
			$(this).removeClass("button-search-disabled");
			$(this).addClass("button-search-enabled");
			$("#btn-search-opportunity").addClass("button-search-disabled");
			$("#btn-search-opportunity").removeClass("button-search-enabled");
			$("#form_search").attr('action','/ngos');
			$(".border_search").css("border-radius", "4px 4px 4px 4px");
			$(".flaticon-house28").show();
			$(".flaticon-palm1").hide();
		}
	});
}
