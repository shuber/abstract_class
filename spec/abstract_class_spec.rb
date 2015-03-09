require File.expand_path('../../lib/abstract_class', __FILE__)

RSpec.describe AbstractClass do
  let(:abstract) { Class.new.extend(described_class) }
  let(:derived)  { Class.new(abstract) }
  let(:error)    { described_class::Error }

  describe '.abstract_classes' do
    it 'should include the abstract class' do
      expect(abstract.abstract_classes).to include(abstract)
    end

    it 'should only include abstract derived classes' do
      expect(abstract.abstract_classes).not_to include(derived)
      derived.extend(described_class)
      expect(abstract.abstract_classes).to include(derived)
    end
  end

  describe '.allocate' do
    it 'should not allow an abstract class to be allocated' do
      initializer = proc { abstract.allocate }
      expect(initializer).to raise_error(error)
    end

    it 'should allow a derived class to be allocated' do
      expect(derived.allocate).to be_is_a(derived)
    end
  end

  describe '.new' do
    it 'should not allow an abstract class to be initialized' do
      initializer = proc { abstract.new }
      expect(initializer).to raise_error(error)
    end

    it 'should allow a derived class to be initialized' do
      expect(derived.new).to be_is_a(derived)
    end
  end
end
