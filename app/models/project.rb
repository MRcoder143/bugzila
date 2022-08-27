class Project < ApplicationRecord
  validates :title,  presence: true
 validates :body, :presence  => true


 has_many :user_projects, dependent: :destroy

# has_and_belongs_to_many :users
 has_many :users , through: :user_projects
 accepts_nested_attributes_for :user_projects, allow_destroy: true

has_many :bugs
 
end
