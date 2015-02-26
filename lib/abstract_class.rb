require 'abstract_class/version'

# Adds the ability to declare classes as abstract
# so that they can't be instantiated or allocated
module AbstractClass
  Error = Class.new RuntimeError

  # When included, it will <tt>alias_method_chain</tt> the <tt>allocate</tt>
  # and <tt>new</tt> methods with <tt>:abstract_class</tt> in <tt>klass</tt>
  def self.included(klass)
    klass.class_eval do
      alias_method :allocate_without_abstract_class, :allocate
      alias_method :allocate, :allocate_with_abstract_class

      alias_method :new_without_abstract_class, :new
      alias_method :new, :new_with_abstract_class
    end
  end

  # Declares this class as abstract and prevents
  # it from being instantiated or allocated
  def abstract
    @abstract = true
  end

  # Checks if this class has been declared as abstract
  def abstract?
    @abstract ||= false
  end

  # Raises RuntimeError if class is abstract, otherwise
  # returns <tt>allocate_without_abstract_class</tt>
  def allocate_with_abstract_class
    if abstract?
      raise Error, "abstract class #{self} can't be allocated"
    else
      allocate_without_abstract_class
    end
  end

  # Raises RuntimeError if class is abstract, otherwise
  # returns <tt>new_without_abstract_class</tt>
  def new_with_abstract_class(*args, &block)
    if abstract?
      raise Error, "abstract class #{self} can't be instantiated"
    else
      new_without_abstract_class(*args, &block)
    end
  end
end

Class.send(:include, AbstractClass)
