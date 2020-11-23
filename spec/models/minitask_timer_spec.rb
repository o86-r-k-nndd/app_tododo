require 'rails_helper'

RSpec.describe MinitaskTimer, type: :model do
  describe 'Formオブジェクトのバリデーション' do
    before do
      @minitask_timer = FactoryBot.build(:minitask_timer)
    end

    describe '保存できる時' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@minitask_timer).to be_valid
      end
    end
    describe '保存できない時' do
      it "timeが空" do
        @minitask_timer.time = nil
        @minitask_timer.valid?
        expect(@minitask_timer.errors.full_messages).to include("Time can't be blank")
      end
      it "nameが空" do
        @minitask_timer.name = nil
        @minitask_timer.valid?
        expect(@minitask_timer.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空" do
        @minitask_timer.text = nil
        @minitask_timer.valid?
        expect(@minitask_timer.errors.full_messages).to include("Text can't be blank")
      end
      it "task_idが空" do
        @minitask_timer.task_id = nil
        @minitask_timer.valid?
        expect(@minitask_timer.errors.full_messages).to include("Task can't be blank")
      end
    end

  end
end