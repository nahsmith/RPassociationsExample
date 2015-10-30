class User < ActiveRecord::Base
   has_many :reviews
    has_many :movies, :through => :reviews
  def self.create_user!(arg)
    self.create!(arg.merge({:session_token => SecureRandom.base64}))
  end
end
