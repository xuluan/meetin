require 'redcarpet/compat'

class Meeting < ActiveRecord::Base
  validates :manager_id, :presence => true
  validates :title, :presence => true
  validates :agenda, :presence => true
  validates :location, :presence => true
  validates :started_at, :presence => true

  belongs_to :manager, :class_name => "User"
  has_many :roles, :dependent => :destroy
  has_many :members, :dependent => :destroy
  has_many :choices, :dependent => :destroy


  def agenda_html
    Markdown.new(agenda, :hard_wrap).to_html
  end
end
