class Owner
  #attr_writer :name
  attr_reader :name, :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
    Cat.all.select {|cat| cat.owner == self}
  end 

  def buy_dog(dog)
    Dog.new(dog, self)
    Dog.all.select {|dog| dog.owner == self}
  end 

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    cats = Cat.all.select {|cat| cat.owner == self}
    dogs = Dog.all.select {|dog| dog.owner == self}
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end