class ParamSet < ApplicationRecord
  searchkick callbacks: :async, highlight: [:tuneProject]

  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy
end
