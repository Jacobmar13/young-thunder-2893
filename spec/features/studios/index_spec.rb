require 'rails_helper'

RSpec.describe 'the Studio index page' do
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
  end
  it 'should display all studios' do
    visit '/studios'
    save_and_open_page
    expect(page).to have_content(@warner.name)
    expect(page).to have_content(@lucasfilm.name)
    expect(page).to have_content(@disney.name)
  end
end
