class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :title
      t.text :autor
      t.string :url
    end
  end
end
