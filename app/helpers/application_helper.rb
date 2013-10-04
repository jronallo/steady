module ApplicationHelper

  def error_text(error)
    case error
    when 'invalid_container_type'
      'You chose an invalid container type.'
    when 'malformed_csv_error'
      'The CSV file is malformed. Please make sure that all the text is in UTF-8 and that there are no empty trailing columns. If you still cannot resolve the issue please send your CSV file via email.'
    else
      'There was an unknown error. Please email your CSV to help resolve the issue.'
    end
  end

  def input_value_from_param(param)
    if param
      param
    else
      ''
    end
  end

end
