class Init < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.timestamps
    end

    create_table :notes do |t|
      t.references :user
      t.text :content

      t.timestamps
    end

  end
end
