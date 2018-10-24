
feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connect
    visit('/')
    click_button 'view all'
    expect(page).to have_content "makers"
    expect(page).to have_content "destroy"
    expect(page).to have_content "google"
  end
end
