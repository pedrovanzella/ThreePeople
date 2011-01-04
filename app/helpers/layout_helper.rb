# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper

  # Return a title on a per-page basis.
  def title
    base_title = "ThreePeople.me - Define a word with three people"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
