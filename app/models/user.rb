class User < ApplicationRecord
  def full_name
    [firstname, lastname].join(' ')
  end
end
