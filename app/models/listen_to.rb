# Listen To Relationship
class ListenTo
  include Neo4j::ActiveRel

  from_class User
  to_class Artist
  type 'listen_to'

  property :weight, type: Integer
end
