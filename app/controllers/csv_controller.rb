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
        send_data ead, :filename => @upload.csv.original_filename + '-ead.xml'
      else
        @title = 'Upload CSV Errors'
        render csv_import_path
      end      
    rescue => e
      Rails.logger.error([e.inspect, e.backtrace.join("\n")].join(''))
      flash[:notice] = 'There was an error processing the CSV file. ' +
      'It may be an error in your CSV file or a bug within the program. ' +
      'Please try again. ' + 
      'If you continue to have problems please contact me and include your CSV file.'
      params[:upload].delete(:csv)
      redirect_to csv_import_path(params[:upload])
    end
  end


end

