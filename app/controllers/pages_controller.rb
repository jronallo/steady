class PagesController < ApplicationController
  def index
    @upload = Upload.new
    @error = params.delete(:error)
  end
end
