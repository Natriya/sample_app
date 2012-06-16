

class User < ActiveRecord::Base
  attr_accessible :email, :nom

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, :presence => true,
                  :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

