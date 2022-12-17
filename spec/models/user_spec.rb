require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、名前と振り仮名、誕生日が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "Kouji1212"
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it "emailに＠を含まない場合登録できない" do
        @user.email = 'abc_abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end


      it "英字のみのパスワードでは登録できない" do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "数字のみのパスワードでは登録できない" do
        @user.password ='11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードとパスワード（確認用）が不一致だと登録できない" do
        @user.password = "11111111"
        @user.password_confirmation = "11111112"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end


      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "苗字が空では登録出来ない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it "苗字が全角（漢字・ひらがな・カタカナでないと登録出来ない)" do
        @user.last_name = "aaa"
        @user.valid?
        
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end

      it "名前が空では登録出来ない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "名前が全角（漢字・ひらがな・カタカナでないと登録出来ない)" do
        @user.first_name = "aaa"
        @user.valid?
      
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end

      it "苗字の振り仮名が空では登録出来ない" do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end

      it "苗字の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_last_name = "aaa"
        @user.valid?
       
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end

      it "苗字の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_last_name = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end

      it "苗字の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_last_name = "亜亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end

      it "名前の振り仮名が空では登録出来ない" do
        @user.kana_first_name = ""
        @user.valid?

        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）は不正な値です")
      end

      it "名前の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_first_name = "aaa"
        @user.valid?

        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end

      it "名前の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_first_name = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end

      it "名前の振り仮名がカタカナ以外では登録出来ない" do
        @user.kana_first_name = "亜亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end

      it "誕生日が空では登録出来ない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      
    end
  end
end