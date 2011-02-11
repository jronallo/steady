require 'spec_helper'

describe "csv/import.html.erb" do
  it "should have some instructions" do
    render
    rendered.should have_selector('h2', :content => 'Upload')
    rendered.should have_selector('form')
    rendered.should have_selector('p', :content => 'Choose a CSV file to upload.')
  end
  
  it 'should include information about the stead schema' do
    render
    rendered.should have_selector('h2', :content => 'Stead schema')
    rendered.should have_selector('dl') do |dl|
      dl.should have_selector('dt', :content => 'series title')
    end
  end
end
