class Role < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :assign, :class_name => "Member"
  belongs_to :meeting

  has_many :choices, :dependent => :destroy

  attr_accessor :cmd
end
