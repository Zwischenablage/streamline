class ValueSetMap < ApplicationRecord
  has_one :value_set
  has_one :param_set
end
