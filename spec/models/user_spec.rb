require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合'
      it 'email、password、password_confirmation、nickname、last_name、first_name
      、last_name_katakana、first_name_katakana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    # context '新規登録できない場合' do
      # it ''
end
