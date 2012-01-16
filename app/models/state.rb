class State < ActiveRecord::Base
    set_table_name "state"
    has_many :cities
end
