var ready = function() {
    $("#ajax-loader").hide();
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  VALIDATION.eventsValidate();

  LOGIN.validateFormOnSubmit();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();
  NGO.getCitiesChecked();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getCausesChecked();
  OPPORTUNITIES.getCitiesChecked();
  OPPORTUNITIES.getRecurrentChecked();

  PASS_RESETS.validateFormResetPassOnSubmit();

  VOLUNTEER.validateFormOnSubmit();

  MOUSEFLOW.callMouseFlow();

  ANALYTICS.callGoogleAnalytics();
}

$(document).ready(ready);
$(document).on('page:load', ready);
