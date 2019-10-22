class Album < ApplicationRecord
  include HTTParty

  belongs_to :user
end
