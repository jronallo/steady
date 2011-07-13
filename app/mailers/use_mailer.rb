class UseMailer < ActionMailer::Base
  default(:from => "jronallo@gmail.com")
  def use_email(upload)
    @upload = upload
    mail(:to => "jronallo@gmail.com", :subject => "steady: #{@upload.name}")
    attachments['upload.csv'] = @upload.csv.read if @upload.csv
  end
end
