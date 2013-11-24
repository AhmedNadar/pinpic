module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
     <div class="alert alert-danger fade in">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
       <h4>Oh snap! You got an error!</h4>
       #{messages}
     </div>
    HTML
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end
end




