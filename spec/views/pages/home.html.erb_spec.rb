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
    rendered.should have_selector('a', :content => 'Try stead!')
    rendered.should_not have_selector('form')
  end
  
end
