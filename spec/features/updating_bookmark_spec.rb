feature 'update' do
  scenario 'it updates bookmark' do
    connect
    visit '/'
    click_button 'view all'
    click_button 'update makers'
    fill_in('url', with: "www.makers.com")
    fill_in('title', with: "Makers sucks")
    click_button 'submit'
    expect(page).to have_content 'Makers sucks'
  end
end
