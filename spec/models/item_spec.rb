require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '出品機能' do
    context '出品ができる時' do
      it "必須項目が全てあれば登録できること" do
        expect(@item).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end
    
    context '出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image.key = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Image can't be blank"}
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'カテゴリーの情報は1以外でないと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態については1以外でないと登録できない' do
      @item.item_condition_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition must be other than 1")
    end

    it '配送料の負担については1以外でないと登録できない' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
    end

    it '発送元の地域の情報は1以外でないと登録できない' do
      @item.prefecture_code_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture code must be other than 1")
    end

    it '発送までの日数については1以外でないと登録できない' do
      @item.preparation_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
    end

    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it "価格が299円以下だと出品できない" do
    @item.price = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が10000000円以上だと出品できない" do
    @item.price = 10000001
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
end
