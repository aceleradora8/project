var PHONES = PHONES || {}
var countFields = 0;
var count = 0;

 PHONES.addPhones = function addPhones(){   
  var max_fields = 9;   
  $(".add_field_button").click(function(e){ 
      e.preventDefault();
      if(countFields < max_fields){ 
          countFields++;
          count++;
          $(".input_fields_wrap").append('\
            <div>\
              <div class="col-lg-11">\
                <input class="form-control" id="phone-ong" name="ngo[phones_attributes]['+count+'][phone_number]" type="tel">\
              </div>\
              <div class="col-lg-1 btn-add align-left">\
                <a href="#" class="remove_field"><span class="glyphicon glyphicon-minus" aria-hidden="true"></a>\
              </div>\
            </div>');
      }
  });      
}

PHONES.removePhones = function removePhones(){ 
  $(".input_fields_wrap").on("click",".remove_field", function(e){
    e.preventDefault(); $(this).parent('div').parent('div').remove(); countFields--;
  });
}