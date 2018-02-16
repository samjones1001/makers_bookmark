feature 'add comment' do
  scenario 'comments appear on the main page' do
    visit('/links')
    first(:button, "Add Comment").click
    fill_in('text', with: 'this is a comment')
    click_button('Add Comment')
    expect(current_path).to eq('/links')
    expect(page).to have_content('this is a comment')
  end
end
