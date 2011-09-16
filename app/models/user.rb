class User < ActiveRecord::Base
  
  has_many :bets
  has_many :scores
  has_many :champions, :through => :scores
  belongs_to :role
  #has_many :positions
  #has_many :roles, :through => :positions
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  def to_param
    username
  end
  
    def admin?(current_user)  
       current_user.role_id == 1
    end  
end
