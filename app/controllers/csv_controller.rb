class CsvController < ApplicationController
  def parse
    @upload = Upload.new(params[:upload])

    begin
      if @upload.valid?
        @upload.csv.rewind
        ead_generator = Stead::EadGenerator.from_csv(@upload.csv.read)
        ead = ead_generator.to_ead
        send_data ead, :filename => @upload.csv.original_filename + '-ead.xml'
      else
        @title = 'Upload CSV Errors'
        render root_path
      end
    rescue Stead::InvalidContainerType => e
      Rails.logger.error([e.inspect, e.backtrace.join("\n")].join(''))
      notice = 'Your CSV file had an invalid container type: ' + e.message +
        '<br/> Valid container types include: ' + Stead::CONTAINER_TYPES.join(', ') +
        end_of_error_message
      flash[:notice] = notice
      params[:upload].delete(:csv)
      redirect_to root_path(params[:upload])
    rescue CSV::MalformedCSVError => e
      Rails.logger.error(e.inspect)
      notice = 'The uploaded CSV file was invalid. Are you sure it is a CSV file? This is the error message given: ' +
        e.message + end_of_error_message
      flash[:notice] = notice
      params[:upload].delete(:csv)
      redirect_to root_path(params[:upload])
    rescue => e
      Rails.logger.error([e.inspect, e.backtrace.join("\n")].join(''))
      flash[:notice] = 'There was an error processing the CSV file. ' +
      'It may be an error in your CSV file or a bug within the program. ' +
      'Please try again. ' + end_of_error_message
      params[:upload].delete(:csv)
      redirect_to root_path(params[:upload])
    end
  end

  private

  def end_of_error_message
    ' <br/> If you continue to have problems please contact me and include your CSV file.'
  end

end
