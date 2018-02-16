feature 'update links' do
  scenario 'existing information is displayed in the form' do
      visit('/')
      first(:button, 'Update').click
      expect(find_field('url').value).to eq 'http://www.makersacademy.com'
      expect(find_field('title').value).to eq 'Makers Academy'
  end

  scenario 'the user can update a link' do
    visit('/')
    first(:button, "Update").click
    fill_in('title', with: 'A Lovely Website')
    click_button('Update')
    expect(current_path).to eq('/')
    expect(page).to have_content('A Lovely Website')
  end
end
