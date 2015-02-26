require_relative '../lib/abstract_class'

RSpec.describe AbstractClass do
  let(:abstract) { Class.new { abstract } }
  let(:derived)  { Class.new abstract }
  let(:error)    { described_class::Error }

  describe '.abstract?' do
    it 'should return true if the class is abstract' do
      expect(abstract).to be_abstract
    end

    it 'should return false if the class is not abstract' do
      expect(derived).not_to be_abstract
    end
  end

  describe '.allocate' do
    it 'should not allow an abstract class to be allocated' do
      initializer = -> { abstract.allocate }
      expect(initializer).to raise_error error
    end

    it 'should allow a derived class to be allocated' do
      initializer = -> { derived.allocate }
      expect(initializer).not_to raise_error
    end

    it 'should allow an abstract class to bypass restrictions' do
      initializer = -> { derived.allocate_without_abstract_class }
      expect(initializer).not_to raise_error
    end
  end

  describe '.new' do
    it 'should not allow an abstract class to be initialized' do
      initializer = -> { abstract.new }
      expect(initializer).to raise_error error
    end

    it 'should allow a derived class to be initialized' do
      initializer = -> { derived.new }
      expect(initializer).not_to raise_error
    end

    it 'should allow an abstract class to bypass restrictions' do
      initializer = -> { derived.new_without_abstract_class }
      expect(initializer).not_to raise_error
    end
  end
end
