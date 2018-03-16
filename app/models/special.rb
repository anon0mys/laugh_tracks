class Special < ActiveRecord::Base
  validates_presence_of :name, :comedian_id
  belongs_to :comedian
end
