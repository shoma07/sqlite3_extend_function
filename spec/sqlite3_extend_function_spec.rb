# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SQLite3ExtendFunction do
  let(:db) { SQLite3::Database.new(':memory:') }

  describe 'ceil' do
    let(:val) { 0.01 }
    subject do
      db.execute("select ceil(#{val})")[0][0]
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
      it 'raise SQLite3::SQLException' do
        expect { subject }.to raise_error SQLite3::SQLException
      end
    end
  end

  describe 'floor' do
    let(:val) { 0.01 }
    subject do
      db.execute("select floor(#{val})")[0][0]
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
      it 'raise SQLite3::SQLException' do
        expect { subject }.to raise_error SQLite3::SQLException
      end
    end
  end

  describe 'cbrt' do
    let(:val) { 27 }
    subject do
      db.execute("select cbrt(#{val})")[0][0]
    end
    context 'value is 27' do
      let(:val) { 27 }
      it 'is 3' do
        is_expected.to eq 3
      end
    end
    context 'value is -64' do
      let(:val) { -64 }
      it 'is -4' do
        is_expected.to eq(-4)
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
      it 'raise SQLite3::SQLException' do
        expect { subject }.to raise_error SQLite3::SQLException
      end
    end
  end
end
