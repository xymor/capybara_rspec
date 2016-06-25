require 'spec_helper'

describe 'news letter box' do
  before do
    visit '/'
  end

  it 'should has link' do
    fill_in 'q', :with => 'Taj Mahal'
    page.should have_content 'Taj Mahal'
  end

  # it 'shoud be hidden by default' do
  #   page.find('.mc-embed-form.subscribe').should_not be_visible
  # end
  #
  # it 'link should open box with textfield' do
  #   page.click_link 'You get it monthly'
  #   page.find('.mc-embed-form.subscribe').should be_visible
  # end
end
