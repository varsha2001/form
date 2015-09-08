class Formfill < ActiveRecord::Base
 validates :firstname, presence: true
 validates :lastname, presence: true
 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
 validates :gender, inclusion: %w(male female)
 validates :interest, presence: true
 validates :state, presence: true, if: "!state.nil?"
 validates :country, presence: true, if: "!country.nil?"

end

