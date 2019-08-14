require('pry')
require_relative('./models/artist')
require_relative('./models/album')


artist1 = Artist.new ( { 'name' => 'Blur' } )
artist1.save()

album1 = Album.new( { 'title' => 'Modern Life is Rubbish',
                      'genre' => 'Britpop',
                      'artist_id' => artist1.id

   })

   album1.save()
