class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :user_languages
  has_many :languages, through: :user_languages

  has_secure_password
end
