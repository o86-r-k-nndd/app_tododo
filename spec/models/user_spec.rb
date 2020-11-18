#Userモデル単体テストコード
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      describe 'ユーザー新規登録がうまくできる時' do
        it "全ての情報が正しく入力されていれば登録できる" do
          expect(@user).to be_valid
        end
      end

      describe 'ユーザー登録がうまくできない時' do
        it "nameが空" do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it "emailが空" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailは一意性である" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordは6文字より小さい" do
          @user.password = "a1234"
          @user.password_confirmation = "a1234"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "確認用のpassword_confirmationの入力が空" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordとpassword_confirmationの値が一致しない時" do
          @user.password = "123abc"
          @user.password_confirmation = "abc123"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
      end
    end
  end
end