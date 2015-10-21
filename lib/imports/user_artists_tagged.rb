parsed_uta = TSV.parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/user_taggedartists.dat').with_header

parsed_uta.each do |x|
  u = User.find_or_create_by(userID: x[0].to_i)
  a = Artist.find_or_create_by(artistID: x[1].to_i)
  at = AllTag.find_or_create_by(tagID: x[2].to_i)
  Tagged.create(from_node: u, to_node: a, tagID: at.tagID, tag_value: at.tag_value, timestamp: Date.new(x[5].to_i, x[3].to_i, x[4].to_i))
end
