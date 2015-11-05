feature 'Tags' do
  scenario 'adding a single tag to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Amazon'
    fill_in 'url', with: 'www.amazon.co.uk'
    fill_in 'tags', with: '#books'
    click_button('Submit')
    link = Link.first
    expect(page.status_code).to eq 200
    expect(link.tags.map(&:name)).to include('#books') #|tag| tag.name
  end

  scenario 'adding multiple tags to a link' do
    visit('/links/new')
    fill_in 'title', with: 'Amazon'
    fill_in 'url', with: 'www.amazon.co.uk'
    fill_in 'tags', with: '#books #shopping'
    click_button('Submit')
    link = Link.first
    expect(page.status_code).to eq 200
    expect(link.tags.map(&:name)).to include('#books', '#shopping')

  end
end
