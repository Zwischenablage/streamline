class ParamSet < ApplicationRecord
  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy

  #validates :productName, presence: true
  #validates :productVersion, presence: true
#  validates :mode, presence: true

end
