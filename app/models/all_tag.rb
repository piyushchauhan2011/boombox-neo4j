# All Tags model
class AllTag
  include Neo4j::ActiveNode
  self.include_root_in_json = false

  property :tagID, type: Integer
  property :tag_value, type: String
end
