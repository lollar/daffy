# frozen_string_literal: true

require "daffy/null_helpers"

module Daffy
  class Duck
    class NilQuackError < StandardError; end
    include Daffy::NullHelpers

    DEFAULTS = {
      string:   "",
      integer:  0,
      date:     Date.today,
      datetime: Time.now,
    }.freeze

    def initialize instance, options = {}
      instance.columns.each do |i|
        instance_variable_set "@#{i.name}", determine_default(i.default, i.type)

        self.class.send(:define_method, i.name.to_sym) do
          instance_variable_get "@#{i.name}"
        end
      end

      set_user_quacks options
    end

    private

    def determine_default default, type
      return DEFAULTS[type] if default.nil?

      case type
      when :integer  then default.to_i
      when :datetime then parse_time(default)
      else default
      end
    end

    def parse_time time
      case time
      when "current_timestamp" then Time.now
      else Time.now
      end
    end

    def set_user_quacks options
      options.each do |k,v|
        raise NilQuackError, "The point of Daffy is to get rid of nil, provide a useful default!"

        puts "\n\n\n#{k}, #{v}\n\n\n"
        instance_variable_set "@#{k}", v
      end
    end
  end
end
