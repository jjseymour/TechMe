
class GauthCreator
   def self.service_from_omniauth(auth)
     user = where(provider_uid: auth.uid).first_or_create do |u|
       #u.name= auth.info.name
       #u.email= auth.info.email
       #u.image = auth.info.image
       u.provider_uid = auth.uid
     end
   end

end

