# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SQLite3ExtendFunction do
  subject(:result) { db.execute(sql)[0][0] }

  let(:db) { SQLite3::Database.new(':memory:') }

  describe 'acos' do
    let(:sql) { "select acos(#{val})" }

    context 'when value is 0' do
      let(:val) { 0 }

      it { is_expected.to eq 1.5707963267948966 }
    end

    context 'when value is 1' do
      let(:val) { 1 }

      it { is_expected.to eq 0 }
    end

    context 'when value is -1' do
      let(:val) { -1 }

      it { is_expected.to eq 3.141592653589793 }
    end
  end

  describe 'ceil' do
    let(:sql) { "select ceil(#{val})" }

    context 'when value is 0.01' do
      let(:val) { 0.01 }

      it { is_expected.to eq 1 }
    end

    context 'when value is -0.01' do
      let(:val) { -0.01 }

      it { is_expected.to eq 0 }
    end

    context 'when value is null' do
      let(:val) { 'null' }

      it { is_expected.to be_nil }
    end

    context 'when value type is string' do
      let(:val) { "'STR'" }

      it { expect { result }.to raise_error SQLite3::SQLException }
    end
  end

  describe 'floor' do
    let(:sql) { "select floor(#{val})" }

    context 'when value is 0.01' do
      let(:val) { 0.01 }

      it { is_expected.to eq 0 }
    end

    context 'when value is -0.01' do
      let(:val) { -0.01 }

      it { is_expected.to eq(-1) }
    end

    context 'when value is null' do
      let(:val) { 'null' }

      it { is_expected.to be_nil }
    end

    context 'when value type is string' do
      let(:val) { "'STR'" }

      it { expect { result }.to raise_error SQLite3::SQLException }
    end
  end

  describe 'cbrt' do
    let(:sql) { "select cbrt(#{val})" }

    context 'when value is 27' do
      let(:val) { 27 }

      it { is_expected.to eq 3 }
    end

    context 'when value is -64' do
      let(:val) { -64 }

      it { is_expected.to eq(-4) }
    end

    context 'when value is null' do
      let(:val) { 'null' }

      it { is_expected.to be_nil }
    end

    context 'when value type is string' do
      let(:val) { "'STR'" }

      it { expect { result }.to raise_error SQLite3::SQLException }
    end
  end
end
