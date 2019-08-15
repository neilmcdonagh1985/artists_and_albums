require_relative('./artist')


class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = options['genre']
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

  def Album.all()
    sql = "SELECT * FROM albums"
     albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def Album.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def find_artist_of_album
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update
    sql =
    "UPDATE albums
    SET (
      title,
      genre,
      artist_id
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4
      RETURNING *
    "
    values = [@title, @genre, @artist_id, @id]
    result = SqlRunner.run(sql, values)
    updated_album = Album.new(result[0])
    return updated_album
  end

  def delete
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_by_id
    sql = "SELECT * FROM albums
    WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    found_album = Album.new(result[0])
    return found_album
  end

end
