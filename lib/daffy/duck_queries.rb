# frozen_string_literal: true

require "daffy/duck"

module Daffy
  module DuckQueries
    def find_by args
      super(args) || Daffy::Duck.new(new.class, user_quacks)
    end
  end
end

ActiveRecord::Base.extend Daffy::DuckQueries
