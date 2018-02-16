feature 'view links' do
  scenario 'all links are visible on the homepage' do
    visit('/links')
    expect(page).to have_content('Makers Academy')
    expect(page).to have_content('Google')
  end
end
