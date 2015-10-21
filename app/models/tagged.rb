# Tag Model
class Tagged
  include Neo4j::ActiveRel
  self.include_root_in_json = false

  from_class User
  to_class Artist
  type 'tagged'

  property :tagID, type: Integer
  property :tag_value, type: String
  property :timestamp, type: Date
end
