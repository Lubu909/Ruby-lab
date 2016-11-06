require 'simplecov'
SimpleCov.start

require 'haszowanie'

RSpec.describe 'haszowanie.rb' do
  before :all do
    @test = Haszowanie.new
  end
  describe 'Haszowanie' do
    it 'should initialize Array' do
      expect(@test.hasz).to be_a_kind_of Array
    end

    describe '#to_int' do
      it 'should be defined' do
        expect { @test.na_int('kot') }.not_to raise_error
      end

      it 'should be integer' do
        expect(@test.na_int('kot')).to be_a_kind_of Integer
      end

      it 'should return correct value' do
        expect(@test.na_int('kot')).to eq(334)
      end
    end

    describe '#haszuj' do
      it 'should be defined' do
        expect { @test.haszuj(5, 16, 1) }.not_to raise_error
      end

      it 'should be integer' do
        expect(@test.haszuj(5, 16, 1)).to be_a_kind_of Integer
      end

      it 'should return correct value' do
        expect(@test.haszuj(5, 16, 1)).to eq(2)
        expect(@test.haszuj(5, 16, 2)).to eq(0)
      end
    end

    describe '#wstaw' do
      it 'should be defined' do
        expect { @test.wstaw(5, 'kot') }.not_to raise_error
      end

      it 'should place hashed value in correct place in array' do
        expect(@test.hasz[4]).to eq('kot')
      end
    end

    describe '#istnieje?' do
      it 'should be defined' do
        expect { @test.istnieje?('kot') }.not_to raise_error
      end

      it 'should return boolean' do
        expect(@test.istnieje?('kot')).to be_a_kind_of TrueClass
        expect(@test.istnieje?('pies')).to be_a_kind_of FalseClass
      end

      it 'should return correct values' do
        expect(@test.istnieje?('kot')).to be true
        expect(@test.istnieje?('pies')).to be false
      end
    end

    describe '#usun' do
      it 'should be defined' do
        expect { @test.usun('pies') }.not_to raise_error
      end

      it 'should return false if value doesn\'t exist' do
        expect(@test.usun('pies')).to be false
      end

      it 'should remove value if it exists' do
        @test.usun('kot')
        expect(@test.istnieje?('kot')).to be false
      end
    end
  end

  describe '#dziwne_dzialanie1' do
    it 'should be defined' do
      expect { dziwne_dzialanie1([1, 2, 3, 4]) }.not_to raise_error
    end

    it 'should be integer' do
      expect(dziwne_dzialanie1([1, 2, 3, 4, 5])).to be_a_kind_of Integer
    end

    it 'returns the correct sum' do
      expect(dziwne_dzialanie1([1, 2, 3, 4, 5])).to eq(-10)
      expect(dziwne_dzialanie1([-1, 0, 1, 2, 3])).to eq(-8)
    end
  end

  describe '#kombinacje_wyrazow' do
    it 'should be defined' do
      expect { kombinacje_wyrazow(%w(kotek plotek mruga)) }.not_to raise_error
    end

    it 'returns an array' do
      expect(kombinacje_wyrazow(%w(kot pies chomik))).to be_a_kind_of Array
    end

    it 'array contains strings' do
      expect(kombinacje_wyrazow(%w(kot pies chomik)).first)
        .to be_a_kind_of String
      expect(kombinacje_wyrazow(%w(1 2 3)).first).to be_a_kind_of String
      expect(kombinacje_wyrazow(%w(jeden 2 trzy)).first).to be_a_kind_of String
    end

    it 'returns correct values' do
      expect(kombinacje_wyrazow(%w(kot pies)))
        .to match_array(['kot pies', 'pies kot'])
    end
  end
end
