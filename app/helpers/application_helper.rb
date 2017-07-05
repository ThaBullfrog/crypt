module ApplicationHelper

  def show_flashes
    returns = Array.new
    flash.each do |message_type, message|
      returns.push(("<div class=\"alert alert-" + message_type + "\">" + message + "</div>"))
    end
    return returns.join.html_safe
  end
  
  def show_errors(errors)
    str = '<div class="alert alert-danger">'
    errors.each_with_index do |error, i|
      str += '&bull;&nbsp;'
      str += error
      unless(i == errors.length - 1)
        str += "<br>"
      end
    end
    str += '</div><br>'
    render html: str.html_safe
  end

end
