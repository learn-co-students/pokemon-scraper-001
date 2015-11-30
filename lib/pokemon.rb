class Pokemon

  attr_accessor :name, :id, :type, :db

  def initialize (id, name, type, db)
    @name = name
    @id = id
    @type = type
    @db = db
  end

  def self.save (p_name, p_type, p_db)
    ins = p_db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.bind_params("#{p_name}", "#{p_type}")
    ins.execute

  end

  def self.find (p_id, p_db)
    fnd = p_db.execute("SELECT * FROM pokemon WHERE id = ?", p_id).first
  end

end