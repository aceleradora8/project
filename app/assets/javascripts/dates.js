var DATES = DATES || {}

DATES.getRecurrentChecked = function() {
$("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
$('#recurrent').on('change', function() {
    $("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
  });
};

DATES.getSpecificDateChecked = function() {
  $('#specific_date').on('change', function() {
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
  $("#dates_field").multiDatesPicker({
        altField: '#dates_opportunities', 
        minDate: 0,
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
        dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
        nextText: 'Próximo',
        prevText: 'Anterior'
      });
}