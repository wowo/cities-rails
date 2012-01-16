class City < ActiveRecord::Base
    set_table_name "city"
    belongs_to :state
end
