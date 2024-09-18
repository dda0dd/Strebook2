class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :occupation, presence: true
  validates :password, length: { minimum: 8 }, on: :create

  has_many :request_comments
  has_many :thoughtse_comments

  def self.guest
    find_or_create_by!(name: "guestcustomer", age: 20) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestcustomer"
      customer.address = "大阪府"
      customer.occupation = "事務職"
      customer.email = "customer@guest"
    end
  end

  def guest?
    name == "guestcustomer"
  end

  def active?
    is_active
  end

  def withdrawn?
    !is_active
  end
end
