require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、
      lruby_last_name、ruby_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    it "passwordが6文字以上の半角英数字混合であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
  end





    context '新規登録できない場合' 
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")

      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
        it 'passwordが5文字以下では登録できない' do
          @user.password = 'abc12'
          @user.password_confirmation = 'abc12'
          @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'パスワードが数字のみでは登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります。")
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'ruby_last_nameのフリガナは空では登録できない' do
          @user.ruby_last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Ruby last name can't be blank", "Ruby last name は必須項目です。", "Ruby last name はカタカナで入力して下さい。")
        end

          it 'ruby_first_nameが空では登録できない' do
          @user.ruby_first_name= ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Ruby first name can't be blank")
          end 
          it "first_nameのフリガナは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
            @user.first_name = "aiueo"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name は全角で入力して下さい")
          end
          it "last_nameのフリガナは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
            @user.last_name = "aiueo"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name は全角で入力して下さい")
          end
          it "ruby_last_nameのフリガナは全角（カタカナ）でなければ登録できない" do
            @user.ruby_last_name = "aiueo"
            @user.valid?
            expect(@user.errors.full_messages).to include("Ruby last name はカタカナで入力して下さい。")
          end
          it "ruby_first_nameのフリガナは全角（カタカナ）でなければ登録できない" do
            @user.ruby_first_name = "aiueo"
            @user.valid?
            expect(@user.errors.full_messages).to include("Ruby first name はカタカナで入力して下さい。")
          end

          it '生年月日が空だと登録できない' do
            @user.birthday = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end
          
          
      end
    end
