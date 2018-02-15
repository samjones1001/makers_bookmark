feature 'add links' do
  scenario 'added links appear on the home page' do
    visit('/')
    fill_in('url', with: 'http://www.mylovelywebsite.com')
    click_button('Add Link')
    expect(page).to have_content('http://www.mylovelywebsite.com')
  end
end
