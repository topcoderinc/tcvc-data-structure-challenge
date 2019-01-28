class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauth_providers => [:facebook]

  serialize :checklist, Hash

  before_create :setup_checklist
  has_many :user_checklists
  has_many :houses
  has_many :todo_lists

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
end

  private

  def setup_checklist
    self.checklist = {
      "Organize Your Finances" => false,
      "Do Calculations" => false,
      "Approval Letter" => false,
      "Find an Agent" => false,
      "Find a lawyer and make an offer" => false,
      "Get the mortgage" => false,
      "Appraisal and Home insepection" => false,
      "Close the deal" => false
    }
  end
end
