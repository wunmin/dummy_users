class User < ActiveRecord::Base
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user == []
      nil
    elsif @user.password == password
      @user
    else
      nil
    end
  end
end
