class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.text :title
      t.belongs_to :exercise, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
