module AbstractClass
  # Contains abstract class testing assertions to include in your test framework
  module TestHelper
    # Asserts that the specified <tt>klass</tt> has been declared as abstract
    def assert_abstract_class(klass)
      assert klass.abstract?, "#{klass} was expected to be abstract"
    end

    # Asserts that the specified <tt>klass</tt> has not been declared as abstract
    def assert_not_abstract_class(klass)
      assert !klass.abstract?, "#{klass} was not expected to be abstract"
    end
  end
end