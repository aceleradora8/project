var DATES = DATES || {}

DATES.getRecurrentChecked = function() {
$("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
$('#recurrent').on('change', function() {
    $("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
  });
};

DATES.getSpecificDateChecked = function() {
  if($('#dates_opportunities').val().length > 0){
    $("#specific_date").attr("checked",true);
    $("#dates_field").show();
    DATES.setDatesPicker();
  }

  $('.div-data-type').on('change', function() {
    if($("#specific_date").is(":checked")){
      $("#dates_field").show();
      DATES.setDatesPicker();
    }else{
      $("#dates_field").hide();

      $("#dates_opportunities").val("");
    }
  });
};

DATES.setDatesPicker = function(){
   array = [];
  array2 = $("#dates_opportunities").val().split(",");
  $.each(array2,function(i,date){
   array.push(date.replace(" ","").split("-").reverse().join("/"));
  });
  array.pop();

  $("#dates_field").multiDatesPicker({
        altField: '#dates_opportunities',
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
        dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
        nextText: 'Próximo',
        prevText: 'Anterior',
        addDates: array.length > 0 ? array : ""
      });
}
