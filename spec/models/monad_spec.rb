require 'spec_helper'
require_relative '../../app/models/monad'

describe Monad do
  describe '.by_name(name)' do
    context 'when something is found by name' do
      let(:found_monad) { double(name: 'is there') }

      before do
        expect(described_class).to receive(:monads).and_return([found_monad])
      end

      it 'returns the monad that matches name' do
        name = 'is there'
        expect(described_class.by_name(name)).to eq(found_monad)
      end
    end

    context 'when nothing is found' do
      it 'returns nil' do
        name = 'not_there'
        expect(described_class.by_name(name)).to be_nil
      end
    end
  end
end
