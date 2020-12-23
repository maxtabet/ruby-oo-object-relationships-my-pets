class Owner
  attr_reader :name, :species
  attr_accessor :pets

  @@all = []
  @@dogs = []
  @@cats = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@dogs << dogs
    @@cats << cats
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(new_cat)
    @@cats << Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    @@dogs << Dog.new(new_dog, self)
  end

  def walk_dogs
    dogs.collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.cats.clear
    self.dogs.clear
  end

  def list_pets
    num_dogs = dogs.size
    num_cats = cats.size
    return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end