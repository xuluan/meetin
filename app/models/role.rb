class Role < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :name

  belongs_to :assign, class_name: "Member"
  belongs_to :meeting

  has_many :choices, dependent: :destroy

  attr_accessor :cmd

end
