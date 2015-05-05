##
# Helper class for overriding default Devise helpers
#
module DeviseHelper
  ##
  # Override the default +devise_error_messages!+ method to make it compatible
  # with Twitter Bootstrap.
  #
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h5 style="margin:0; padding:0">#{sentence}</h5>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
end
