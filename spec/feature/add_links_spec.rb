feature 'add links' do
  scenario 'added links appear on the home page' do
    visit('/links')
    fill_in('url', with: 'http://www.mylovelywebsite.com')
    fill_in('title', with: 'A Lovely Website')
    click_button('Add Link')
    expect(page).to have_content('A Lovely Website')
  end

  scenario 'invalid links are not added to the home page' do
    visit('/links')
    fill_in('url', with: 'not a url')
    fill_in('title', with: 'not a website')
    click_button('Add Link')
    expect(page).to_not have_content('not a url')
    expect(page).to have_content('Please enter a valid url')
  end
end
