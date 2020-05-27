class Role < ActiveRecord::Base
    belongs_to :show
    belongs_to :actor
end