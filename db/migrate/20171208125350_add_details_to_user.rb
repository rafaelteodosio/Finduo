class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :data_de_nascimento, :date
    add_column :users, :elo, :string
  end
end
