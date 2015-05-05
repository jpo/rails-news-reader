##
# Helper class for displaying flash messages
#
module FlashHelper
  ##
  # Type of messages to display when using +flash_messages+
  #
  FLASH_TYPES = [:notice, :success, :alert, :failure, :info]

  ##
  # Checks for flash messages. If flash messages exist, render the javascript
  # necessary to display each message using the toastr js library. If no flash
  # messages exist, nothing is rendered.
  #
  def flash_messages
    return if flash.empty?
    return if (keys = (flash.keys & FLASH_TYPES)) && keys.empty?

    capture do
      keys.each do |key|
        type = case key
               when :notice, :success then :success
               when :alert, :failure then :error
               else :info
               end

        concat %{
          <script type='text/javascript'>
            toastr.#{type}(\"#{flash[key]}\", \"\", { closeButton: true });
          </script>
        }.html_safe
      end
    end
  end
end
