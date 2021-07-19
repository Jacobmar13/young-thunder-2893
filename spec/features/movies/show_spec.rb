require 'rails_helper'

RSpec.describe 'the Movie show page' do
  before do
    @warner = Studio.create!(
      name: 'Warner Bros.',
      location: 'Hollywood'
    )
    @lucasfilm = Studio.create!(
      name: 'Lucasfilm Ltd.',
      location: 'Hollywood'
    )
    @disney = Studio.create!(
      name: 'Disney',
      location: 'Hollywood'
    )
    @raiders = @lucasfilm.movies.create!(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure'
    )
    @temple_doom = @lucasfilm.movies.create!(
      title: 'Indiana Jones and the Temple of Doom',
      creation_year: 1984,
      genre: 'Action/Adventure'
    )
    @last_crusade = @lucasfilm.movies.create!(
      title: 'Indiana Jones and the Last Crusade',
      creation_year: 1989,
      genre: 'Action/Adventure'
    )
    @h_ford = Actor.create!(
      name: 'Harrison Ford',
      age: 79
    )
    @k_allen = Actor.create!(
      name: 'Karen Allen',
      age: 69
    )
    @j_r_davies = Actor.create!(
      name: 'John Rhys-Davies',
      age: 77
    )
    MovieActor.create!(movie: @raiders, actor: @h_ford)
    MovieActor.create!(movie: @raiders, actor: @k_allen)
    MovieActor.create!(movie: @raiders, actor: @j_r_davies)
  end
  it "should display movie and it's attributes" do
    visit "/movies/#{@raiders.id}"

    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@raiders.creation_year)
    expect(page).to have_content(@raiders.genre)
  end
  it "should display actors in movie" do
    visit "/movies/#{@raiders.id}"

    expect(page).to have_content(@h_ford.name)
    expect(page).to have_content(@k_allen.name)
    expect(page).to have_content(@j_r_davies.name)
  end
end
