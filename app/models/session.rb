class Session < ApplicationRecord
  belongs_to :project
  enum session_type: [:Porting, :APQM, :Tuning]
  has_many :paramsets , inverse_of: :machine
  accepts_nested_attributes_for :paramsets
end
