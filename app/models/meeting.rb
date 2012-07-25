require 'redcarpet/compat'

class Meeting < ActiveRecord::Base

  def agenda_html
    Markdown.new(agenda, :hard_wrap).to_html
  end
end
