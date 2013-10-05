class PagesController < ApplicationController
  def index
    @upload = Upload.new
    @upload_error = params.delete(:error)
  end
end
