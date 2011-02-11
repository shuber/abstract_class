module AbstractClass
  # Contains abstract class testing assertions to include in your test framework
  module TestHelper
    # Asserts that the specified <tt>klass</tt> has been declared as abstract
    def assert_abstract_classes(*classes)
      result, message = abstract_class_test(classes.flatten, true)
      assert_block(message) { result }
    end
    alias_method :assert_abstract_class, :assert_abstract_classes

    # Asserts that the specified <tt>klass</tt> has not been declared as abstract
    def assert_not_abstract_classes(*classes)
      result, message = abstract_class_test(classes.flatten, false)
      assert_block(message) { result }
    end
    alias_method :assert_not_abstract_class, :assert_not_abstract_classes

    protected

      def abstract_class_test(classes, abstract) # :nodoc:
        failed_classes = classes.send(abstract ? :reject : :select) { |klass| klass.abstract? }
        class_names = failed_classes.join(', ')
        message = failed_classes.size > 1 ? 'were' : 'was' and (message << ' not' unless abstract)
        [failed_classes.empty?, "#{class_names} #{message} expected to be abstract"]
      end
  end
end