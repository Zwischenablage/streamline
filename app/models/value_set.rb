class ValueSet < ApplicationRecord
  belongs_to :param_set
  has_many :parameters, dependent: :destroy
  accepts_nested_attributes_for :parameters
end
