class ParamSet < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
   mappings dynamic: false do
     indexes :productName, type: :text
     indexes :productVersion, type: :text
     indexes :tuneProject, type: :text, analyzer: :english
   end
 end

 def self.search_func(query)
   puts "serch_func!!"
   puts "YAML query" + query.to_yaml
  self.search({
    query: {
      bool: {
        must: [
        {
          multi_match: {
            query: query,
            fields: [:productName, :productVersion, :tuneProject]
          }
        }]
      }
    }
  })
end

  belongs_to :session
  #has_many :valuesetmaps, dependent: :destroy
end
