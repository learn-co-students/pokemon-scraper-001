require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id: 0, name: "unknown", type: "unknown", hp: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    insert.execute(name, type)
  end

  def self.find(id, db)
    find = db.prepare("SELECT * FROM pokemon WHERE pokemon.id = ?")
    results = find.execute(id).to_a
    
    if results != []
      Pokemon.new(id: results[0][0], name: results[0][1], type: results[0][2], hp: results[0][3], db: db)
    else
      nil
    end
  end

  def alter_hp(hp, db)
    update = db.prepare("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?;")
    update.execute(hp, @id)
  end

end
