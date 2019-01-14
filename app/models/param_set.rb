class ParamSet < ApplicationRecord
  searchkick callbacks: :async, highlight: [:mode]

  scope :search_import, -> { includes(:value_sets) }

  def search_data
    {
      book_types: value_sets.map(&:name),

      projectName: projectName,
      productName: productName,
      productVersion: productVersion,
      mode: mode,
      valueset: value_sets,
      countParamSets: mode

    }
  end
  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy
  has_many :value_sets, dependent: :destroy
  accepts_nested_attributes_for :value_sets
end
