class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :user_languages
  has_many :languages, through: :user_languages

  has_secure_password

  def self.from_omniauth(auth)
    user = where(provider_uid: auth.uid).first_or_create do |u|
      #u.name= auth.info.name
      #u.email= auth.info.email
      #u.image = auth.info.image
      u.provider_uid = auth.uid
    end
  end

  def add_omniauth_params(auth)
    #binding.pry 
    update(provider_uid: auth.uid) unless provider_uid
    update(g_access_token: auth.credentials.token, g_refresh_token: auth.credentials.refresh_token) if provider_uid == auth.uid
  end

end
