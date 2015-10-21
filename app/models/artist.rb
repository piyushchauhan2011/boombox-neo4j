# Artist Model
class Artist
  include Neo4j::ActiveNode
  self.include_root_in_json = false

  property :artistID, type: Integer, index: :exact
  property :name, type: String
  property :url, type: String
  property :picture_url, type: String

  property :sum_artist_weight, type: Integer, default: 0
  property :total_listeners_count, type: Integer, default: 0

  has_many :in, :users, rel_class: :ListenTo
  has_many :in, :tags, rel_class: :Tagged
end
