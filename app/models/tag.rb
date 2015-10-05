# Tag Model
class Tag
  include Neo4j::ActiveNode

  property :tagID, type: Integer
  property :tag_value, type: String
  property :timestamp, type: Date

  has_one :in, :user, origin: :tags
  has_one :out, :artist, type: :artist
end
