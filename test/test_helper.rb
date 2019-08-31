$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "daffy"

require "minitest/autorun"

require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :first_name
    t.string :last_name
    t.date   :enrolled_on
    t.integer :login_attempts
    t.string :email
    t.integer :level, default: 1
    t.datetime :created_at, default: "current_timestamp"
  end
end

ActiveRecord::Schema.define do
  create_table :guests do |t|
    t.string :first_name, default: "Guest"
    t.string :last_name, default: "User"
    t.date   :enrolled_on
    t.integer :login_attempts, default: 1
    t.string :email
    t.integer :level
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class User < ApplicationRecord
  include Daffy
end

class Guest < ApplicationRecord
  include Daffy
  quacks email: "no-reply@guest.com"
end
