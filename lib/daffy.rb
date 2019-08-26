require "active_record"

require "daffy/version"
require "daffy/duck_queries"

module Daffy
  extend DuckQueries
  class Error < StandardError; end
end

ActiveRecord::Base.send :include, Daffy
