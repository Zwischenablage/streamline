class Session < ApplicationRecord
  enum session_type: [:Porting, :APQM, :Tuning]

  belongs_to :project
  has_many :param_sets, dependent: :destroy
  accepts_nested_attributes_for :param_sets
end
