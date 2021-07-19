Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
MovieActor.destroy_all

universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
lucasfilm = Studio.create(name: 'Lucasfilm Ltd.', location: 'Hollywood')
lucasfilm.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
