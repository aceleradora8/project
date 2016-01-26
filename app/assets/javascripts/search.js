var SEARCH = SEARCH || {}

SEARCH.searchCity = function(){

  SEARCH.getResultSearchCities = function(request, response){
  $.ajax({
    dataType: "json",
    url: $('#form_search').attr('action') === "/ngos" ? "/autocomplete/ngos/cities" : "/autocomplete/opportunities/cities",
    type: "GET",
    data : {
        "city" : request.term
    },
    success: function(data){
      console.log(data);
        var result_list = [];
        for(var i = 0; i< data.length; i++){
            var result = {
                label : data[i],
                value : data[i]
            };
            result_list.push(result);
        }
        response(result_list);
    }
  });
}

$("#city").autocomplete({
        minLength: 3,
        source:function (request, response){
             SEARCH.getResultSearchCities(request, response);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }
    });

}

SEARCH.beginSearchAutocomplete = function(){
    $("#city").keyup(function() {
        if ($(this).val().length >= 1) {
          SEARCH.searchCity();
        }
    });
}

SEARCH.clickButtonSearch = function(){
	if($(location).attr('pathname') === "/ngos"){
		$(".flaticon-palm1").hide();
		$(".flaticon-house28").show();
		$("#form_search").attr('action','/ngos');
	}else{
		$(".flaticon-palm1").show();
		$(".flaticon-house28").hide();
	}

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