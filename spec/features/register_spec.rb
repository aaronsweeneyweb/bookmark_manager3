feature 'sign up user' do
  scenario 'user inputs username and password' do
    visit('/register')
    fill_in 'username', with: 'Dave'
    fill_in 'password'
    click_button 'register'
    expect(User.new).to change{User.count}.by(1)
    expect(page).to have_content "Welcome #{User.name}"
    expect(User.name).to eq 'Dave'
  end
end
