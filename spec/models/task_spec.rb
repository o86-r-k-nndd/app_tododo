require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#create' do
    before do
      @task = FactoryBot.build(:task)
    end

    describe 'タスクの新規作成ができる時' do
      it "全ての値が正しく入力されていれば保存できる" do
        expect(@task).to be_valid
      end
      it "textは空でも保存できる" do
        @task.text = nil
        expect(@task).to be_valid
      end
    end
    describe 'タスクが新規作成できない時' do
      it "タスクが空" do
        @task.name = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Name can't be blank")
      end
    end

  end
end
