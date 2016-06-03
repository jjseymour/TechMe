class Job < ApplicationRecord
  has_many :user_jobs
  has_many :users, through: :user_jobs
  belongs_to :language
end
