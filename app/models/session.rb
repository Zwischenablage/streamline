class Session < ApplicationRecord
  belongs_to :project
  #has_many :param_sets, dependent: :destroy
end
