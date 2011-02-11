class CsvController < ApplicationController
  def import
    @title = 'Upload CSV'
  end

  def upload
    begin
      ead_generator = Stead::EadGenerator.from_csv(params[:upload][:csv].read)
      ead = ead_generator.to_ead
      render :xml => ead
    rescue
      flash[:notice] = 'There was an error processing the CSV file. ' +
      'It may be an error in your CSV file or a bug within the program. ' +
      'Please try again.'
      redirect_to csv_import_path
    end

    # While under development, just respond by rendering some in-line text.
    # Send back the request parameters in JSON (JavaScript Object Notation)
    # format, i.e. something reasonably easy to parse with the human eye.
    #render :text => params[:upload][:csv].read
  end


end

