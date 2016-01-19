var ready = function() {
    $("#ajax-loader").hide();
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  VALIDATION.eventsValidate();

  LOGIN.validateFormOnSubmit();
  LOGIN.disableButtonOnSubmitForgotPass();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();
  NGO.getCitiesChecked();
  NGO.checkCauses();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getCausesChecked();
  OPPORTUNITIES.getCitiesChecked();
  OPPORTUNITIES.getRecurrentChecked();
  OPPORTUNITIES.checkCategories();

  PASS_RESETS.validateFormResetPassOnSubmit();

  VOLUNTEER.validateFormOnSubmit();

  MOUSEFLOW.callMouseFlow();

  ANALYTICS.callGoogleAnalytics();
}

$(document).ready(ready);
$(document).on('page:load', ready);
