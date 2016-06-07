class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :user_languages
  has_many :languages, through: :user_languages

  #include Gauth::GauthCreator 

  has_secure_password

  def self.from_omniauth(auth)
    GauthCreator.service_from_omniauth(auth)
  end

  def add_omniauth_params(auth)
    update(provider_uid: auth.uid) unless provider_uid
    update(g_access_token: auth.credentials.token, g_refresh_token: auth.credentials.refresh_token) if provider_uid == auth.uid
  end

end
