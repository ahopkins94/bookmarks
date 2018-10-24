feature 'Adding' do
  scenario 'It should add a new bookmark' do
    visit '/'
    fill_in('title', with: 'myfavouritewebsite')
    fill_in('url', with: 'www.myfavouritewebsite.com')
    click_button 'add'
    click_button 'view all'
    expect(page).to have_content('myfavouritewebsite')
  end
end
