module ApplicationHelper
  def show_flash
    [:notice, :error, :warning].collect do |key|
      flash[key]
    end.join
  end
end
