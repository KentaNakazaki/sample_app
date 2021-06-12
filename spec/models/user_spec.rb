require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, name: name, email: email) }
  let(:name) { 'hoge' }
  let(:email) { 'hoge@example.com' }
  describe 'User model' do
    subject { user.valid? }

    example 'should be valid' do
      expect(subject).to be_truthy 
    end

    context "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
        first.last@foo.jp alice+bob@baz.cn]

      valid_addresses.each do |valid_address|
        example "#{valid_address} should be valid" do
          user.email = valid_address
          expect(subject).to  be_truthy
        end
      end
    end
    

    context 'should not be valid' do
      example 'name should be present' do
        user.name = ''
        expect(subject).to  be_falsey
      end

      example 'email should be present' do
        user.email = ''
        expect(subject).to  be_falsey
      end

      example 'name should not be too long' do
        user.name = 'a' * 51
        expect(subject).to  be_falsey
      end
  
      example 'email should not be too long' do
        user.email = 'a' * 244 + '@example.com'
        expect(subject).to  be_falsey
      end
    end
    
    example "email addresses should be unique" do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      expect(duplicate_user.valid?).to  be_falsey
    end

    example "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user.email = mixed_case_email
      user.save
      expect(user.email).to eq mixed_case_email.downcase
    end
    
    example "password should be present (nonblank)" do
      user.password = user.password_confirmation = " " * 6
      expect(user.valid?).to  be_falsey
    end
    
    example "password should have a minimum length" do
      user.password = user.password_confirmation = "a" * 5
      expect(user.valid?).to  be_falsey
    end
  end
  
end
