Rails.application.config.middleware.use OmniAuth::Builder do
     provider :facebook, '1685367745077455', '01d21a7fbdae445378d99cb763358257', :scope => "email", info_fields: 'email,name,first_name,last_name,gender'
end
