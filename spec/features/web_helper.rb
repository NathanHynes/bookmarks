

def create_bookmark
  visit('/')
  click_button 'Add bookmark'
  fill_in :url, with: 'https://www.bbc.co.uk'
  fill_in :title, with: 'BBC'
  click_button 'Add'
end
