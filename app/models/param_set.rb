class ParamSet < ApplicationRecord
  searchkick callbacks: :async, highlight: [:mode]

  scope :search_import, -> { includes(:parameters) }

  def search_data
    {
      projectName: projectName,
      productName: productName,
      productVersion: productVersion,
      mode: mode,
      valueset: value_sets,
      parameters: parameters
    }
  end

  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy
  has_many :value_sets, dependent: :destroy
  has_many :parameters, :through => :value_sets
  accepts_nested_attributes_for :value_sets
end
