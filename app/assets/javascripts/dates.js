var DATES = DATES || {}

DATES.setFieldsRecurrent = function(){
  $("#div-weekdays").show();
  $("#div-shifts").show();
  $("#div-specific_date").hide();
  $("#dates_opportunities").val("");
}

DATES.setFieldsSpecifcDates = function(){
  if($('#dates_opportunities').val().length > 0){
    $("#specific_date").attr("checked",true);
    $("#div-specific_date").show();
    DATES.setDatesPicker();
  }
  $("#div-specific_date").show();
  $("#div-shifts").show();
  $("#div-weekdays").hide();
  DATES.setDatesPicker();
  $('.weekday-checkbox:checkbox').prop('checked',false);
}

DATES.setFieldsToBeDefined = function(){
  $("#div-specific_date").hide();
  $("#div-weekdays").hide();
  $("#div-shifts").hide();
  $("#dates_opportunities").val("");
  $('.weekday-checkbox:checkbox').prop('checked',false);
  $('.shift-checkbox:checkbox').prop('checked',false);
}


DATES.setFieldsAccordingToDateType = function() {
    if($("#specific_date").is(":checked")){
      DATES.setFieldsSpecificDates();
    }else if($("#recurrent").is(":checked")) {
      DATES.setFieldsRecurrent();
    }else{
      DATES.setFieldsToBeDefined();
    }
};

DATES.setEventDateType = function(){
  $('.div-data-type').on('change', function() {
    DATES.setFieldsAccordingToDateType();
  });
}

DATES.setDatesPicker = function(){
   array = [];
  array2 = $("#dates_opportunities").val().split(",");
  $.each(array2,function(i,date){
   array.push(date.replace(" ","").split("-").reverse().join("/"));
  });
  array.pop();

  $("#div-specific_date").multiDatesPicker({
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
