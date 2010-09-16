class CsvController < ApplicationController
  def import
  end

  def upload
    ead_generator = Stead::EadGenerator.from_csv(params[:upload][:csv].read)
    ead = ead_generator.to_ead
    render :xml => ead

    # While under development, just respond by rendering some in-line text.
    # Send back the request parameters in JSON (JavaScript Object Notation)
    # format, i.e. something reasonably easy to parse with the human eye.
    #render :text => params[:upload][:csv].read
  end


end

