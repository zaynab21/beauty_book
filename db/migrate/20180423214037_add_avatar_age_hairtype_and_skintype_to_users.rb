class AddAvatarAgeHairtypeAndSkintypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :age, :integer
    add_column :users, :skin_type, :text
    add_column :users, :hair_type, :text
    add_column :users, :description, :text
  end
end
