# Helper used to create service classes
module AlphaPay

  # Callable
  module Callable

    def call(*args, &block)
      new(*args).call(&block)
    end

  end

end
