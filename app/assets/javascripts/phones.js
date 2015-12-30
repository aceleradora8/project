var PHONES = PHONES || {}
var countFields = 0;
var count = 0;
var max_fields = 5;

 PHONES.addPhones = function addPhones(){
    $(".add_field_button").click(function(e){ 
      e.preventDefault();
      if(countFields < max_fields){ 
          countFields++;
          count++;
          $(".input_fields_wrap").append('\
            <div class="col-lg-2 form-group">\
              <input class="form-control phone_with_ddd validate-phone", id="phone-ngo", name="ngo[phones_attributes]['+count+'][phone_number]" type="tel">\
            </div>');
      }
  });      
}

PHONES.loadPhones = function loadPhones(){
  if ($("#phones-ngo").length) {
    if ($("#phones-ngo").val() != "") {
      $.each(JSON.parse($("#phones-ngo").val()), function(i, phone) {
        countFields++;
        count++;
        $(".input_fields_wrap").append('\
          <div class="col-lg-2 form-group">\
            <input value="'+phone+'" class="form-control phone_with_ddd validate-phone", id="phone-ngo", name="ngo[phones_attributes]['+count+'][phone_number]" type="tel">\
          </div>'); 
      });
    }
  }
}

PHONES.removePhones = function removePhones(){ 
  $(".remove_field").on("click", function(e){
    if(countFields>0) {
    e.preventDefault(); $(".input_fields_wrap").children().last().remove(); countFields--;
    };
  });
}
