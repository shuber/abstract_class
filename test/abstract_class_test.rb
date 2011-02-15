require 'test_helper'

class AbstractClassTest < Test::Unit::TestCase
  def setup
    @base_class = Class.new { abstract }
    @derived_class = Class.new(@base_class)
  end

  def test_should_not_allow_abstract_class_to_be_initialized
    assert_raises(RuntimeError) { @base_class.new }
  end

  def test_should_not_allow_abstract_class_to_be_allocated
    assert_raises(RuntimeError) { @base_class.allocate }
  end

  def test_should_allow_derived_class_to_be_initialized
    assert @derived_class.new.is_a?(@derived_class)
  end

  def test_should_allow_derived_class_to_be_allocated
    assert @derived_class.allocate.is_a?(@derived_class)
  end

  def test_should_check_if_a_class_is_abstract
    assert @base_class.abstract?
    assert !@derived_class.abstract?
  end

  def test_should_bypass_instantiation_restrictions
    assert @derived_class.new_without_abstract_class.is_a?(@derived_class)
  end

  def test_should_bypass_allocation_restrictions
    assert @derived_class.allocate_without_abstract_class.is_a?(@derived_class)
  end

  def test_should_assert_class_is_abstract
    assert_abstract_class @base_class
    assert_raises(Test::Unit::AssertionFailedError) { assert_abstract_class @derived_class }
  end

  def test_should_assert_class_is_not_abstract
    assert_not_abstract_class @derived_class
    assert_raises(Test::Unit::AssertionFailedError) { assert_not_abstract_class @base_class }
  end
end