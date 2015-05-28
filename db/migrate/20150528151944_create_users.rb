class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |info|
      info.string :name
      info.string :email
      info.string :password
      info.datetime :created_at
      info.datetime :updated_at
    end
  end
end
