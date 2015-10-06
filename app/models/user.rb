# User Model with Self Referencing
class User
  include Neo4j::ActiveNode
  self.include_root_in_json = false

  property :userID, type: Integer, index: :exact

  has_many :both, :friends, type: :friends, model_class: :User
  has_many :out, :artists, rel_class: :ListenTo
  has_many :out, :tags, type: :tags
end
