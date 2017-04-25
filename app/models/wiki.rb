class Wiki < ActiveRecord::Base
  belongs_to :user
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }

  has_many :collaborators
  has_many :users#, through: :collaborators

  extend FriendlyId
  friendly_id :title, use: :slugged
end
