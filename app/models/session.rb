class Session < ApplicationRecord
  enum session_type: [:Porting, :APQM, :Tuning]
  enum session_state: [:requested, :scheduled, :feedback, :active, :closed]

  belongs_to :project
  has_many :param_sets, dependent: :destroy
  accepts_nested_attributes_for :param_sets
end
