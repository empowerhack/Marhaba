module ApplicationHelper

  def translateBoolean(bool)
    bool == true ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>'  end

end
