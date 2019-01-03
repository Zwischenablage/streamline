class Session < ApplicationRecord
  belongs_to :project
  enum session_type: [:Porting, :APQM, :Tuning]
  #has_many :param_sets, dependent: :destroy
end
