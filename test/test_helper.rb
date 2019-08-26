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
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class User < ApplicationRecord
  include Daffy
end
