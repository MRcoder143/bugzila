class Bug < ApplicationRecord
  belongs_to :user,class_name: 'User'
  belongs_to :project
  belongs_to :resolver,class_name: 'User'


  has_one_attached :screenshot, :dependent => :destroy


validates :title,  presence: true
validates :deadline,  presence: true
validates :project_id,  presence: true
validates :resolver_id,  presence: true
validates :user_id,  presence: true
validates :bugtype,  presence: true
validates :status,  presence: true

end
