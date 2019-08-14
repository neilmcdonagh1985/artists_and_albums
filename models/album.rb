require_relative('./artist')


class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = ['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "
    INSERT INTO albums
    (
      artist_id,
      title,
      genre
      )
    VALUES
    ($1, $2, $3)
    RETURNING id
  "
    values = [@artist_id, @title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end


end
