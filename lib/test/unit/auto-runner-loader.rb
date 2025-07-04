require_relative "test-suite-creator"

module Test
  module Unit
    module AutoRunnerLoader
      @loaded = false
      class << self
        def check(test_case, method_name)
          return if @loaded
          return unless TestSuiteCreator.test_method?(test_case, method_name)
          require_relative "../unit"
          @loaded = true
        end
      end
    end
  end
end
