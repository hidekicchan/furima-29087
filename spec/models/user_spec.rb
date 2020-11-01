require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      # emailテスト
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が空だと登録できない' do
        @user.email = 'aaaacom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      # passwordテスト
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは5文字以下だと登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordは半角数字のみの場合、登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # ユーザー本名名字名前テスト
      it 'ユーザーの名字が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'ユーザーの名字が全角でないと登録できない' do
        @user.family_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end
      it 'ユーザーの名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーの名前が全角でないと登録できない' do
        @user.first_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      # ユーザー本名フリガナテスト
      it 'ユーザー本名のフリガナの名字が空だと登録できない' do
        @user.reading_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading family can't be blank")
      end
      it 'ユーザー本名のフリガナの名字が全角（カタカナ）でないと登録できない' do
        @user.reading_family = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading family kana Full-width katakana characters')
      end
      it 'ユーザー本名のフリガナの名前が空だと登録できない' do
        @user.reading_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first can't be blank")
      end
      it 'ユーザー本名のフリガナの名前が全角（カタカナ）でないと登録できない' do
        @user.reading_first = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading first kana Full-width katakana characters')
      end

      # 生年月日テスト
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
