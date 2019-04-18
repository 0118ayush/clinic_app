class CreateUsers < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :name
      t.string :postcode
      t.string :dob
      t.string :email_address
      t.integer :bank_account
      t.timestamps
    end
  end

end
