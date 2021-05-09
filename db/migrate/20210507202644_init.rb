class Init < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :email
      t.string :name
      t.string :image

      t.timestamps
    end

    create_table :locations do |t|
      t.references :parent, foreign_key: { to_table: :locations }
      t.string :name

      t.timestamps
    end

    create_table :weather_reports do |t|
      t.references :city, foreign_key: { to_table: :locations }
      t.string :weather
      t.integer :temperature

      t.timestamps
    end

    create_table :covid_reports do |t|
      t.references :country, foreign_key: { to_table: :locations }
      t.integer :cases
      t.integer :deaths
      t.integer :recovered

      t.timestamps
    end

    create_table :notes do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :city, foreign_key: { to_table: :locations }
      t.references :weather_report, foreign_key: { to_table: :weather_reports }
      t.references :covid_report, foreign_key: { to_table: :covid_reports }
      t.text :content
      t.date :travelled_at

      t.timestamps
    end
  end
end
