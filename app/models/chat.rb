class Chat < ActiveRecord::Base
    belongs_to :user, foreign_key: "man_id"
end
