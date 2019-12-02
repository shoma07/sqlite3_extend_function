# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SQLite3ExtendFunction do
  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: ':memory:'
    )
  end

  describe 'ceil' do
    let(:val) { 0.01 }
    subject do
      ActiveRecord::Base.connection.select_one("select ceil(#{val})").values[0]
    end
    context 'value is 0.01' do
      let(:val) { 0.01 }
      it 'is 1' do
        is_expected.to eq 1
      end
    end
    context 'value is -0.01' do
      let(:val) { -0.01 }
      it 'is 0' do
        is_expected.to eq 0
      end
    end
    context 'value is null' do
      let(:val) { 'null' }
      it 'is nil' do
        is_expected.to be_nil
      end
    end
    context 'value type is string' do
      let(:val) { "'STR'" }
      it 'is 0' do
        is_expected.to eq 0
      end
    end
  end

  describe 'floor' do
    let(:val) { 0.01 }
    subject do
      ActiveRecord::Base.connection.select_one("select floor(#{val})").values[0]
    end
    context 'value is 0.01' do
      let(:val) { 0.01 }
      it 'is 0' do
        is_expected.to eq 0
      end
    end
    context 'value is -0.01' do
      let(:val) { -0.01 }
      it 'is -1' do
        is_expected.to eq(-1)
      end
    end
    context 'value is null' do
      let(:val) { 'null' }
      it 'is nil' do
        is_expected.to be_nil
      end
    end
    context 'value type is string' do
      let(:val) { "'STR'" }
      it 'is 0' do
        is_expected.to eq 0
      end
    end
  end
end
