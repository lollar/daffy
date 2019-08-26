# frozen_string_literal: true

require "daffy/null_helpers"

module Daffy
  class Duck
    include Daffy::NullHelpers

    DEFAULTS = {
      string: "",
      integer: 0,
      date: Date.today,
    }.freeze

    def initialize instance
      instance.columns.each do |i|
        instance_variable_set("@#{i.name}", determine_default(i.default, i.type))

        self.class.send(:define_method, i.name.to_sym) do
          instance_variable_get("@#{i.name}")
        end
      end
    end

    private

    def determine_default(default, type)
      return DEFAULTS[type] if default.nil?

      case type
      when :integer then default.to_i
      else default
      end
    end
  end
end
