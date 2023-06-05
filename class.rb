class Author
  attr_reader :name

  def initialize(name)
    @name = name
    @articles = []
  end

  def articles
    @articles
  end

  def magazines
    @articles.map { |article| article.magazine }.uniq
  end

  def add_article(magazine, title)
    article = Article.new(self, magazine, title)
    @articles << article
    magazine.articles << article
    article
  end

  def topic_areas
    magazines.map { |magazine| magazine.category }.uniq
  end
end

class Magazine
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @articles = []
    @@all << self
  end

  def self.all
    @@all
  end

  def articles
    @articles
  end

  def contributors
    @articles.map { |article| article.author }.uniq
  end

  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end

  def article_titles
    @articles.map { |article| article.title }
  end

  def contributing_authors
    author_articles = @articles.group_by { |article| article.author }
    author_articles.select { |_author, articles| articles.count > 2 }.keys
  end
end

class Article
  attr_reader :author, :magazine, :title
  @@all = []

  def initialize(author, magazine, title)
    @author = author
    @magazine = magazine
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end
end
