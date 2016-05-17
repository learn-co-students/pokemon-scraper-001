require 'pry'

class Pokemon
	attr_accessor :id, :name, :type, :db

	def initialize(id, name, type, db)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.find(id, db)
	  sql = <<-EOM
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
      EOM

      db.execute(sql, id).flatten 
	end

	def self.insert(name, type, db)
		sql = <<-EOM
		INSERT INTO pokemon
		(name, type)
		VALUES
		(?, ?)
		EOM

		db.execute(sql, name, type)
	end

	def update(name, type, db)
		sql = <<-EOM
		UPDATE pokemon
		SET (name = ?, type = ?)
		WHERE id = ?
		EOM

		db.execute(sql, name, type)
	end

  def self.save(name, type, db)
  	 insert(name, type, db)
   # persisted? ? update(name, type, db) : insert(name, type, db)
  #  binding.pry

  end
end
