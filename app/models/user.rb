class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :dob, presence: true
  validate :check_age, on: :create


  def full_name
    [first_name, last_name].join(' ')
  end
  protected

  def check_age
    if dob?
      if dob > Time.now - 20.years
        errors.add(:dob, "Sorry, mate, you're not old enough for these bottles.")
      end
    end
  end
end
