# Artist Model
class Artist
  include Neo4j::ActiveNode

  property :artistID, type: Integer, index: :exact
  property :name, type: String
  property :url, type: String
  property :picture_url, type: String

  has_many :in, :users, origin: 'listen_to'
  has_many :in, :tags
end
