require 'rails_helper'

describe User do 
	let(:user) { User.new(name: 'Ethan Washbourne', email: 'ewashbourne@gmail.com',
												password: 'foobar', password_confirmation: 'foobar') }

	subject { user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe 'validations' do 
		describe 'name' do 
			context 'not present' do 
				before { user.name = nil }
				it { should_not be_valid }
			end

			context 'too short' do 
				before { user.name = 'e' * 2 }
				it { should_not be_valid }
			end

			context 'too long' do 
				before { user.name = 'e' * 255 }
				it { should_not be_valid }
			end
		end
	end

	describe 'email' do 
		context 'not present' do 
			it 'is invalid' do 
				user.email = ''
				expect(user).to_not be_valid
			end
		end

		context 'too long' do
			it 'is invalid' do 
				user.email = 'e' * 255
				expect(user).not_to be_valid
			end
		end
	end

	context 'valid format' do 
		it 'is valid' do 
			valid_addresses = %w{ user@foo.com U_SE_R@u.s.org 
			                      first.last@foo.jp a+b@baz.cn u@r.co }
      valid_addresses.each do |address|
      	user.email = address
      	expect(user).to be_valid
      end
    end
  end

  context 'invalid format' do 
  	it 'is invalid' do 
  		invalid_addresses = %w{ user@foo,com new_user_at_foo.org example_use@foo. 
  		                        foo@bar_baz.com foo@bar+baz.com user@new...com }

      invalid_addresses.each do |address|
      	user.email = address
      	expect(user).to_not be_valid
      end
    end
  end

  context 'not unique' do 
  	before do 
  		user_with_same_email = user.dup
  		user_with_same_email.save

  		it { should_not be_valid }
  	end
  end

  context 'mixed case' do
  	it 'is saved as lowercase' do 
  		mixed_case_email = 'EwaSHboUrne@gmAIL.Com'
  		user.email = mixed_case_email
  		user.save

  		expect(user.reload.email).to eq(mixed_case_email.downcase)
  	end
  end
  			
end




# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end