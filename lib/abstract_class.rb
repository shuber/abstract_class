# Adds the ability to declare classes as abstract so that they can't be instantiated or allocated
module AbstractClass
  autoload :TestHelper, 'abstract_class/test_helper'
  autoload :Version,    'abstract_class/version'

  # When included, it will <tt>alias_method_chain</tt> <tt>allocate</tt> and <tt>new</tt> methods with <tt>:abstract_class</tt> in <tt>klass</tt>
  def self.included(klass)
    klass.class_eval do
      alias_method :allocate_without_abstract_class, :allocate
      alias_method :allocate, :allocate_with_abstract_class

      alias_method :new_without_abstract_class, :new
      alias_method :new, :new_with_abstract_class
    end
  end

  # Declares this class as abstract and prevents it from being instantiated or allocated
  def abstract
    @abstract = true
  end

  # Checks if this class has been declared as abstract
  def abstract?
    @abstract ||= false
  end

  # Raises RuntimeError if class is abstract, otherwise returns <tt>allocate_without_abstract_class</tt>
  def allocate_with_abstract_class
    abstract? ? raise("abstract class #{self} can't be allocated") : allocate_without_abstract_class
  end

  # Raises RuntimeError if class is abstract, otherwise returns <tt>new_without_abstract_class</tt>
  def new_with_abstract_class(*args, &block)
    abstract? ? raise("abstract class #{self} can't be instantiated") : new_without_abstract_class(*args, &block)
  end
end

Class.send(:include, AbstractClass)