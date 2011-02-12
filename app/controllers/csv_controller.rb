class CsvController < ApplicationController
  def import
    @title = 'Upload CSV'
    @upload = Upload.new
  end

  def upload
    begin
      @upload = Upload.new(params[:upload])
      UseMailer.use_email(@upload).deliver
      if @upload.valid?
        @upload.csv.rewind
        ead_generator = Stead::EadGenerator.from_csv(@upload.csv.read)
        ead = ead_generator.to_ead
        render :xml => ead
      else
        render csv_import_path
      end      
    rescue => e
      Rails.logger.debug([e.inspect, e.backtrace.join("\n")].join(''))
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

