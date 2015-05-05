##
# Helper class for the NewsController
#
module NewsHelper
  ##
  # Returns 'active' if the given +id+ matches +params[:id]+. Intended to be
  # used with a bootstrap nav menu.
  #
  # Usage:
  #
  # <ul class="nav nav-pills nav-stacked">
  #   <li class="<%= set_active_class(model.id) %>">...</li>
  # </ul>
  #
  def set_active_class(id = nil)
    return 'active' if id.to_i == params[:id].to_i
  end
end
