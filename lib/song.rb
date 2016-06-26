class Song
  
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|e| e.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect{|e| e.name == name} == nil 
      self.create_by_name(name)
    else
      self.all.detect{|e| e.name == name}
    end

  end

  def self.alphabetical

    @@all.sort_by!{|e|e.name.downcase}

  end

  def self.new_from_filename(filename)
    names = filename.split(".")[0].split(" - ")
    song = self.new
    song.name = names[1]
    song.artist_name = names[0]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = @@all.clear
  end
end
