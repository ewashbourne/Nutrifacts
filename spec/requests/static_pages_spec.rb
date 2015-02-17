require 'rails_helper'

describe 'static pages' do |variable|
	subject { page }

	describe 'home page' do 
		before { visit root_path }

		it { should have_title('Nutrition App') }
		# it { should have_selector('h1', text: 'Home') }
	end

	describe 'about page' do 
		before { visit about_path }
		
		it { should have_title('About | Nutrition App') }
		# it { should have_selector('h1', text: 'About') }
	end
end