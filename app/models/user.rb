 require 'rubygems'

 require 'role_model'
class User < ActiveRecord::Base
  authenticates_with_sorcery!

  include RoleModel
  roles :coordinator, :instructor, :student

  attr_accessible :email, :password, :password_confirmation, :roles, :roles_mask


  roles_attribute :roles_mask

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  # attr_accessible :title, :body
  has_many :posts, dependent: :destroy
end
