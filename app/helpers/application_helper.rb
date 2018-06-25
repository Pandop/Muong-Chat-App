module ApplicationHelper
  def bootstrap_class_for flash_type
    {success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
  end

  def flash_messages(opts={})
    flash.map do |key, message|
      content_tag(:div,message,class:"alert #{bootstrap_class_for(key)} show") do
      content_tag(:button,'x'.html_safe,class:'close',data: {dismiss: 'alert'}) + message 
      end
    end.join.html_safe
  end
end


