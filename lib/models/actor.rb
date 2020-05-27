class Actor < ActiveRecord::Base
    has_many :roles
    has_many :shows, through: :roles
end