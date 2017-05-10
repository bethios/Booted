class Wiki < ActiveRecord::Base
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  extend FriendlyId
  friendly_id :title, use: :slugged
end
