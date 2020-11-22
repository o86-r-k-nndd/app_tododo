require 'rails_helper'

RSpec.describe Minitask, type: :model do
  describe '#create' do
    before do
      @minitask = FactoryBot.build(:minitask)
    end

    describe 'タスクの新規作成ができる時' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@minitask).to be_valid
      end
      it "textは空でも保存できる" do
        @minitask.text = nil
        expect(@minitask).to be_valid
      end
    end
    describe 'タスクが新規作成できない時' do
      it "タスクが空" do
        @minitask.name = nil
        @minitask.valid?
        expect(@minitask.errors.full_messages).to include("Name can't be blank")
      end
    end

  end
end
