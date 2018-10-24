feature 'delete' do
  scenario 'it should delete a bookmark' do
    connect
    visit '/'
    click_button 'view all'
    click_button 'delete makers'
    expect(page).not_to have_content "makers"
  end
end
