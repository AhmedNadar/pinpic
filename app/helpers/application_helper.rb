module ApplicationHelper

# Rails flash messages using Twitter Bootstrap
# https://gist.github.com/suryart/7418454
def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end
 
  def flash_messages(opts = {})
    capture do
      flash.each do |msg_type, message|
        concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          concat message 
        end)
      end
      nil
    end
  end
  # captures the content so it isn’t appended straight to the page. Instead, it’s built up as a separate string, for your custom helper to return
  # http://thepugautomatic.com/2013/06/helpers/
end