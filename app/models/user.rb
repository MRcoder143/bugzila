class User < ApplicationRecord
  has_many :user_bugs, class_name: 'Bug', foreign_key: 'user_id'
  has_many :resolver_bugs, class_name: 'Bug', foreign_key: 'resolver_id'

 enum usertype: {manager: 0, developer: 1, QA: 2}



  has_secure_password
# has_and_belongs_to_many :project

validates :name,  presence: true
validates :email, :presence  => true
validates :password, :presence  => true
validates :usertype, :presence  => true

has_many :user_projects, dependent: :destroy
has_many :projects ,through: :user_projects





 accepts_nested_attributes_for :user_projects
end
