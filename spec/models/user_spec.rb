require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'email、password、password_confirmation、nickname、last_name、first_name
      、last_name_katakana、first_name_katakana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '456def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在しているがpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameが半角数字では登録できない' do
        @user.last_name = '18'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameが半角英字では登録できない' do
        @user.last_name = 'matsuzaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが半角数字では登録できない' do
        @user.first_name = '18'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが半角英字では登録できない' do
        @user.first_name = 'matsuzaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      # it 'first_nameが全角数字では登録できない' do
      #   @user.first_name = '１８'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First name is invalid")
      # end
      # it 'first_nameが全角英字では登録できない' do
      #   @user.first_name = 'ｚｊｈｇ'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First name is invalid")
      # end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid')
      end
      it 'last_name_katanakaがかなでは登録できない' do
        @user.last_name_katakana = 'まつざか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid')
      end
      it 'last_name_katanakaが漢字では登録できない' do
        @user.last_name_katakana = '松坂'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana is invalid')
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'first_name_katanakaがかなでは登録できない' do
        @user.first_name_katakana = 'まつざか'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'first_name_katanakaが漢字では登録できない' do
        @user.first_name_katakana = '松坂'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
