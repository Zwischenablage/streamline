class ParamSet < ApplicationRecord
  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy
end
