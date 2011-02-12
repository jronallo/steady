module ApplicationHelper
  
  def try_stead_link?
    if params[:controller] == 'csv' and params[:action] == 'import'
      false
    else
      true
    end
  end
  
  def input_value_from_params(params, key)
    if params[key]
      params[key]
    elsif params[:upload] and params[:upload][key]
      params[:upload][key]
    end
  end
  
  
end
