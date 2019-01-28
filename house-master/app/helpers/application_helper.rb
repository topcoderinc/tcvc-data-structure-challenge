module ApplicationHelper

  def get_active_class(path)
    'active' if current_page?(path)
  end
  
end
