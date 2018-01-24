ActsAsTaggableOn::Tag.destroy_all

ActsAsTaggableOn::Tag.seed do |s|
  s.id    = 1
  s.name = "#ruby"
end

ActsAsTaggableOn::Tag.seed do |s|
  s.id    = 2
  s.name = "#php"
end

ActsAsTaggableOn::Tag.seed do |s|
  s.id    = 3
  s.name = "#ruby"
end