require 'spec_helper'

describe "pages/home.html.erb" do

#  FIXME: can't test layout from here?  
#  it "should have the layout stuff" do
#    render
#    rendered.should have_selector('h1', :content => 'Steady')
#  end
  
  it "should have some explanatory text" do
    render    
    rendered.should have_selector('h2', :content => 'The Problem')
    rendered.should have_selector('p', :content => 'Donors sometimes')
    rendered.should have_selector('h2', :content => 'The Solution')
    rendered.should_not have_selector('form')
  end
  
  it 'should have a menu to other pages' do
    pending
    render 
    rendered.should have_selector('a', :content => 'contact')
    rendered.should have_selector('a', :content => 'about')
  end
  
  it 'should direct the user to try the application' do
    render
    rendered.should have_selector('div', :id => 'try') do |div|
      div.should have_selector('a', :content => 'Try stead!')
    end
  end
  
end
