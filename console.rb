require('pry')
require_relative('./models/artist')
require_relative('./models/album')


Album.delete_all
Artist.delete_all



artist1 = Artist.new ( { 'name' => 'Blur' } )
artist1.save()

album1 = Album.new( { 'title' => 'Modern Life is Rubbish',
                      'genre' => 'Britpop',
                      'artist_id' => artist1.id

   })
   album1.save()

artist2 = Artist.new ( { 'name' => 'Radiohead' } )
artist2.save()
album2 = Album.new( { 'title' => 'The Bends',
                      'genre' => 'Alternative Rock',
                      'artist_id' => artist2.id
   })
   album2.save()

artist3 = Artist.new ( { 'name' => 'Daft Punk'} )
artist3.save()
album3 = Album.new( { 'title' => 'Discovery',
                      'genre' => 'dance',
                      'artist_id' => artist3.id
  } )
album3.save()


all_albums = Album.all
all_artists =  Artist.all

located_album = artist2.find_albums

found_artist_by_album_title = album3.find_artist_of_album

artist1.update
album2.update

album3.delete
artist3.delete

found_artist = artist2.find_by_id

found_album = album1.find_by_id

binding.pry
nil
