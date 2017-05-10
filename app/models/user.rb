class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save { self.email = email.downcase }
  after_initialize { self.role ||= :standard }

  enum role: [:standard, :admin, :premium]

  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  #has_many: :wikis_as_collaborator, through: :collaborators, source: :wikis
end
