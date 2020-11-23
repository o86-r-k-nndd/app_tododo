require 'rails_helper'

RSpec.describe Timer, type: :model do
  before do
    @timer = FactoryBot.build(:timer)
  end

  describe '日付の値を保存できる時' do
    it "全ての値が正しく入力されていれば保存できる" do
      expect(@timer).to be_valid
    end
  end
  describe '日付の値が保存できない時' do
    it "タスクが空" do
      @timer.time = nil
      @timer.valid?
      expect(@timer.errors.full_messages).to include("Time can't be blank")
    end
  end
end
