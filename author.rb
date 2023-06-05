author1 = Author.new("John")
magazine1 = Magazine.new("Nature", "Science")
article1 = author1.add_article(magazine1, "The Impact of Climate Change")

puts author1.name # "John"
puts magazine1.name # "Nature"
puts article1.title # "The Impact of Climate Change"
puts author1.articles.include?(article1) # true
puts author1.magazines.include?(magazine1) # true
puts magazine1.articles.include?(article1) # true
puts magazine1.contributors.include?(author1) # true
