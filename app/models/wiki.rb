class Wiki < ActiveRecord::Base
  belongs_to :user
  default_scope { order('updated_at DESC') }
  after_initialize { self.private ||= false }
end
