require 'rails_helper'

RSpec.describe FoodFactsController, :type => :controller do

  let(:food_fact1) { FoodFact.create(item_name: "Big Mac", brand_name: "McDonald's",
                                     nf_serving_size_qty: 1, nf_calories: 5000, 
                                     nf_total_fat: 800) }  

  let(:food_fact2) { FoodFact.create(item_name: "Mega Burrito", brand_name: "Chipotle",
                                     nf_serving_size_qty: 1, nf_calories: 5500, 
                                     nf_total_fat: 1000) }

  describe 'GET #index' do 
    it 'renders index' do 
      get :index 
      expect(response).to render_template(:index)
  end

    # it 'populate an array of food_facts' do 
    #   get :index
    #   expect(assigns(:food_facts)).to eq([food_fact1, food_fact2])
    # end
  end

  describe 'DELETE #destroy' do 
    it 'deletes requested food_fact' do 
      food_fact_for_removal =  FoodFact.create(item_name: "Big Mac", brand_name: "McDonald's",
                                               nf_serving_size_qty: 1, nf_calories: 5000, 
                                               nf_total_fat: 800) 
      expect{
        delete :destroy, id: food_fact_for_removal.id 
      }.to change(FoodFact, :count).by(-1)
    end

    it 'redirects to index' do 
      food_fact_for_removal = FoodFact.create(item_name: "Big Mac", brand_name: "McDonald's",
                                               nf_serving_size_qty: 1, nf_calories: 5000, 
                                               nf_total_fat: 800) 
      delete :destroy, id: food_fact_for_removal.id 
      expect(response).to redirect_to(index_path)
    end
  end
end
