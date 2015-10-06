parsed_uf = TSV.parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/tags.dat').with_header

parsed_uf.each do |x|
  t = AllTag.new
  t.tagID = x[0].to_i
  t.tag_value = x[1]
  t.save
end
