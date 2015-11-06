
feature "User sign up" do
  scenario "user signs up successfully" do
    sign_up
    expect(page.status_code).to eq(200)
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@email.com')
    expect(User.first.email).to eq('user@email.com')
  end
end
