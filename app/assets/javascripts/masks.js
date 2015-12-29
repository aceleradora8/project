var MASKS = MASKS || {}

MASKS.addMasks = function addMasks() {
  $('.cep').mask('00000-000');
  $('.phone_with_ddd').mask('(00)0000-0000');
  $('.cpf').mask('000.000.000-00', {
    reverse: true
  });
}
