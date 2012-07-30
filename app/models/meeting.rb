require 'redcarpet/compat'


class RoleValidator < ActiveModel::Validator
  def validate(record)
    unless record.role_list.strip.length > 0
      record.errors[:role_list] << 'Role List cannot be empty'
    end
  end
end

class MemberValidator < ActiveModel::Validator
  def validate(record)
    member_list = record.member_list.split(';')
    
    i = 0
    member_list.each do |member|
      member.strip!
      next if member.length == 0 #skip when email is empty
      unless member.strip =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[:member_list] << ("All members in Member List must be valid email address.")
        break
      end   
      i += 1
    end
    record.errors[:member_list] << 'Member List cannot be empty' if i == 0
  end
end

class Meeting < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with RoleValidator  
  validates_with MemberValidator  

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
