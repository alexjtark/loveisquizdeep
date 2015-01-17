class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :image_url
      t.date :birthdate
      t.text :bio
      t.string :gender
      t.string :email
      t.string :seeking
      t.string :location
      t.timestamps
    end
  end
end
