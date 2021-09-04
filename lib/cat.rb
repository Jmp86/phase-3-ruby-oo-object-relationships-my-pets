class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@cats = []

  def initialize (name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end
  
  def save
    @@cats << self
  end

  def self.all
    @@cats
  end

end