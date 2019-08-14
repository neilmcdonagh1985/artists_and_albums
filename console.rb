require('pry')
require_relative('./models/artist')
require_relative('./models/album')


Album.delete_all
Artist.delete_all



artist1 = Artist.new ( { 'name' => 'Blur' } )
artist2 = Artist.new ( { 'name' => 'Radiohead' } )
artist3 = Artist.new ( { 'name' => 'Daft Punk'} )

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new( { 'title' => 'Modern Life is Rubbish',
                      'genre' => 'Britpop',
                      'artist_id' => artist1.id

   })

album2 = Album.new( { 'title' => 'The Bends',
                      'genre' => 'Alternative Rock',
                      'artist_id' => artist2.id
   })

album3 = Album.new( { 'title' => 'Discovery',
                      'genre' => 'dance',
                      'artist_id' => artist3.id
  } )

album1.save()
album2.save()
album3.save()

all_albums = Album.all
all_artists =  Artist.all

located_album = artist2.find_albums

found_artist_by_album_title = album3.find_artist_of_album

binding.pry
nil


# located_albums = artist1.find_albums(artist1.id)
