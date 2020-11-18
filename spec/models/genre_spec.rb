require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe '#create' do
    before do
      @genre = FactoryBot.build(:genre)
    end

    describe 'ジャンルの新規作成ができる時' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@genre).to be_valid
      end
      it "textは空でも保存できる" do
        @genre.text = nil
        expect(@genre).to be_valid
      end
    end
    describe 'ジャンルが新規作成できない時' do
      it "ジャンル名が空" do
        @genre.name = nil
        @genre.valid?
        expect(@genre.errors.full_messages).to include("Name can't be blank")
      end
    end

  end
end