User.destroy_all
Clinic.destroy_all
Booking.destroy_all


ash = User.create(name: "Ayush", postcode: "NE5 3TA", :dob => "20/12/1994", bank_account: 1000000)
elle = User.create(name: "Elle", postcode: "E2 4AF", :dob => "19/04/2000", bank_account: 10)
patrick = User.create(name: "Patrick", postcode: "SE1 5AP", :dob => "21/06/1992", bank_account: 500)
ivan = User.create(name: "Ivan", postcode: "W10 5EF", :dob => "20/12/1991", bank_account: 63843)

north = Clinic.create(clinic_name: "North London Health Centre", doctor_name: "Dr Gutman", address: "Palmers Green, London N13 4JJ", postcode: "N13 4JJ")
east = Clinic.create(clinic_name: "East One Health", doctor_name: "Dr Shelly", address: "14 Deancross St, Shadwell, London E1 2QA", postcode: "E1 2QA")
south = Clinic.create(clinic_name: "South Lewisham Health Centre", doctor_name: "Dr Francis", address: "50 Conisborough Cres, London SE6 2SS", postcode: "SE6 2SS")
west = Clinic.create(clinic_name: "Health Education England", doctor_name: "Dr Ralph", address: "Stewart House 32 Russell Square, Bloomsbury, London WC1B 5DN", postcode: "WC1B 5DN")

booking1 = Booking.create(user: ash, clinic: north, price: 50, reason: "I have a stomach bug")
bookin2 = Booking.create(user: elle, clinic: east, price: 2, reason: "I have ADHD.")
bookin3 = Booking.create(user: patrick, clinic: south, price: 20, reason: "My eyes hurt")
bookin4 = Booking.create(user: ivan, clinic: west, price: 50, reason: "I'm just passing the time really")
bookin5 = Booking.create(user: elle, clinic: east, price: 1, reason: "People say I smell...")
