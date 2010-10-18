require 'spec_helper'

describe "csv/import.html.erb" do
  it "should have some instructions" do
    render
    rendered.should have_selector('h2', :content => 'Upload')
    rendered.should have_selector('form')
    rendered.should have_selector('p', :content => 'Choose a CSV file to upload.')
    rendered.should have_selector('p', :content => 'schema')
  end
end
