require 'rails_helper'

describe FoodFact do 
  let(:food_fact) { FoodFact.new(item_name: "Big Mac", brand_name: "McDonald's",
                                     nf_serving_size_qty: 1, nf_calories: 5000, 
                                     nf_total_fat: 800) }

  subject { food_fact }

  it { should respond_to(:item_name) }
  it { should respond_to(:brand_name) }
  it { should respond_to(:nf_serving_size_qty) }
  it { should respond_to(:nf_calories) }
  it { should respond_to(:nf_total_fat) }

  it { should be_valid }

  describe 'validations' do 
    describe 'item_name' do 
      context 'not present' do 
        before { food_fact.item_name = nil }
        it { should_not be_valid }
      end
    end
  end

    context 'too short' do 
      before { food_fact.item_name = 'a' * 2 }
      it { should_not be_valid }
    end

    context 'too long' do 
      before { food_fact.item_name = 'a' * 255 }
      it { should_not be_valid }
    end

  describe 'brand_name' do 
    context 'not_present' do 
      before { food_fact.brand_name = nil }
      it { should_not be_valid }
    end
  end 
end
