class Project < ApplicationRecord
  belongs_to :customer
  has_many :sessions, dependent: :destroy
end
