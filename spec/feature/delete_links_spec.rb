feature 'delete links' do
  scenario 'user can delete a link' do
    visit('/links')
    first(:button, "Delete").click
    expect(page).to_not have_content('Makers Academy')
  end
end
