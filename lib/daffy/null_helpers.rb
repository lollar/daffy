# frozen_string_literal: true

module Daffy
  module NullHelpers
    def present?
      false
    end

    def nil?
      true
    end

    def blank?
      true
    end
  end
end
