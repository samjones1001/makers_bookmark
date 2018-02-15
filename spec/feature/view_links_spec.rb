feature 'view links' do
  scenario 'all links are visible on the homepage' do
    visit('/')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
  end
end
