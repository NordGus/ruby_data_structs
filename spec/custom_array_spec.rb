require 'custom_array'

describe CustomArray do
  describe '.new' do
    context 'given no size' do
      it 'initializes with size zero' do
        array = CustomArray.new
        expect(array.items.count).to eq 0
        expect(array.count).to eq 0
      end
    end

    context 'given size of 4' do
      it 'initializes with size four' do
        array = CustomArray.new 4
        expect(array.items.count).to eq 4
        expect(array.count).to eq 0
      end
    end

    context 'given negative size (-1)' do
      it 'throws ArgumentError' do
        expect { CustomArray.new -1 }.to raise_error ArgumentError
      end
    end

    context 'given non Integer size (1.25)' do
      it 'throws ArgumentError' do
        expect { CustomArray.new 1.25 }.to raise_error TypeError
      end
    end
  end

  describe '#insert' do
    before(:all) { @array = CustomArray.new 1 }
    before(:all) { @initial_items = @array.items.dup }

    it 'insert the given value in the position defined by count' do
      current_count = @array.count
      value = 2

      @array.insert value

      expect(@array.items[current_count]).to eq value
      expect(@array.count).to eq(current_count + 1)
    end

    it 'resize items by 2 times count and insert the given value in the position defined by count' do
      current_count = @array.count
      value = 3

      @array.insert value

      expect(@array.items.count).to_not eq(@initial_items.count)
      expect(@array.items.count).to eq(current_count * 2)
      expect(@array.items[current_count]).to eq value
      expect(@array.count).to eq(current_count + 1)
    end
  end
end