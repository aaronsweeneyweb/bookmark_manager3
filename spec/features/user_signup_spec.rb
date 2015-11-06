
feature "User sign up" do
  scenario "user signs up successfully" do
    sign_up
    expect(page.status_code).to eq(200)
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@email.com')
    expect(User.first.email).to eq('user@email.com')
  end

  scenario "mismatching password info does not create a new account" do
    sign_up
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'user@email.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
  end

end
