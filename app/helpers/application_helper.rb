module ApplicationHelper
  
  def try_stead_link?
    if params[:controller] == 'csv' and params[:action] == 'import'
      false
    else
      true
    end
  end
end
