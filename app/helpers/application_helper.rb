module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "ThreePeople.me - Define a word with three peple"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
