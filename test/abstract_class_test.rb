require 'test_helper'

class BaseClass
  abstract
end

class DerivedClass < BaseClass
end

class AbstractClassTest < Test::Unit::TestCase
  def test_should_not_allow_abstract_class_to_be_initialized
    assert_raises(RuntimeError) { BaseClass.new }
  end

  def test_should_not_allow_abstract_class_to_be_allocated
    assert_raises(RuntimeError) { BaseClass.allocate }
  end

  def test_should_allow_derived_class_to_be_initialized
    assert DerivedClass.new.is_a?(DerivedClass)
  end

  def test_should_allow_derived_class_to_be_allocated
    assert DerivedClass.allocate.is_a?(DerivedClass)
  end

  def test_should_check_if_a_class_is_abstract
    assert BaseClass.abstract?
    assert !DerivedClass.abstract?
  end

  def test_should_bypass_instantiation_restrictions
    assert DerivedClass.new_without_abstract_class.is_a?(DerivedClass)
  end

  def test_should_bypass_allocation_restrictions
    assert DerivedClass.allocate_without_abstract_class.is_a?(DerivedClass)
  end

  def test_should_assert_class_is_abstract
    assert_abstract_class BaseClass
    assert_raises(Test::Unit::AssertionFailedError) { assert_abstract_class DerivedClass }
  end

  def test_should_assert_class_is_not_abstract
    assert_not_abstract_class DerivedClass
    assert_raises(Test::Unit::AssertionFailedError) { assert_not_abstract_class BaseClass }
  end
end