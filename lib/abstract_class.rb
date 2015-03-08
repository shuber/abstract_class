require 'abstract_class/version'

# Declares a class as abstract which prevents instantiation or allocation.
module AbstractClass
  # The exception raised when an abstract class is instantiated or allocated.
  Error = Class.new(RuntimeError)

  def self.extended(mod)
    mod.abstract_classes << mod
  end

  # Stores a collection of classes that have been declared as abstract.
  def abstract_classes
    @@abstract_classes ||= []
  end

  # Raises {AbstractClass::Error} if the class is abstract
  def allocate(*args)
    raise_if_abstract(:allocated) { super }
  end

  # Raises {AbstractClass::Error} if the class is abstract
  def new(*args)
    raise_if_abstract(:instantiated) { super }
  end

  private

  def raise_if_abstract(type)
    if abstract_classes.include?(self)
      raise Error, "abstract class #{self} can't be #{type}"
    else
      yield
    end
  end
end
