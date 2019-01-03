class ValueSetMap < ApplicationRecord
  belongs_to :value_set
  belongs_to :param_set
end
