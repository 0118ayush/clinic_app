class CreateClinics < ActiveRecord::Migration[4.2]

  def change
    create_table :clinics do |t|
      t.string :clinic_name
      t.string :doctor_name
      t.string :address
      t.string :postcode
      t.timestamps
    end
  end

end
