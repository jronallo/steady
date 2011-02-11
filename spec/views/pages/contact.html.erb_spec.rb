require 'spec_helper'

describe "pages/contact.html.erb" do

#  FIXME: can't test layout from here?  
#  it "should have the layout stuff" do
#    render
#    rendered.should have_selector('h1', :content => 'Steady')
#  end
  
  it "should have my address" do
    render    
    rendered.should have_selector('a', :content => 'jronallo@gmail.com')
  end
  
  it "should have my name" do
    render
    rendered.should have_selector('p', :content => 'Jason Ronallo')
  end
  
#  Can't test the layout from here?
  it 'should have a link back to the homepage' do
    pending
    render
    rendered.should have_selector('a', :content => 'Steady')
  end
  
end
