module Daffy
  module Quack
    extend self

    def quacks(options = {})
      puts options
      @quacks = options
    end

    def load_quacks
      @quacks
    end
  end
end

ActiveRecord::Base.extend Daffy::Quack
