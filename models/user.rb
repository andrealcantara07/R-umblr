class User < ActiveRecord::Base
    has_many :blogs, dependent: :destroy

end