
feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connect
    visit('/')
    click_button 'view all'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
