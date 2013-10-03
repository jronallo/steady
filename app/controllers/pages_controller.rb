class PagesController < ApplicationController
  def index
    @upload = Upload.new
  end
end
