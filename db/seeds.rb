User.destroy_all
Clinic.destroy_all
Booking.destroy_all


ash = User.create(name: "Ayush", email_address: "ash@gmail.com",postcode: "NE5 3TA", :dob => "20/12/1994", bank_account: 1000000)
elle = User.create(name: "Elle", email_address: "elle@gmail.com", postcode: "E2 4AF", :dob => "19/04/2000", bank_account: 10)
patrick = User.create(name: "Patrick", email_address: "patrick@hotmail.com", postcode: "SE1 5AP", :dob => "21/06/1992", bank_account: 500)
ivan = User.create(name: "Ivan", email_address: "ivan@hotmail.com", postcode: "W10 5EF", :dob => "20/12/1991", bank_account: 63843)

north = Clinic.create(clinic_name: "North London Health Centre", doctor_name: "Dr Gutman", address: "Palmers Green, London N13 4JJ", postcode: "N13 4JJ")
east = Clinic.create(clinic_name: "East One Health", doctor_name: "Dr Shelly", address: "14 Deancross St, Shadwell, London E1 2QA", postcode: "E1 2QA")
south = Clinic.create(clinic_name: "South Lewisham Health Centre", doctor_name: "Dr Francis", address: "50 Conisborough Cres, London SE6 2SS", postcode: "SE6 2SS")
west = Clinic.create(clinic_name: "Health Education England", doctor_name: "Dr Ralph", address: "Stewart House 32 Russell Square, Bloomsbury, London WC1B 5DN", postcode: "WC1B 5DN")


booking1  = Booking.create(price: 10, reason: nil, day:"Monday", time: "12.00")
booking2  = Booking.create(price: 20, reason: nil, day: "Monday", time: "13.00")
booking3  = Booking.create(price: 30, reason: nil, day: "Monday", time: "14.00")
booking4  = Booking.create(price: 40, reason: nil, day: "Monday", time: "15.00")
booking5  = Booking.create(price: 50, reason: nil, day: "Monday", time: "16.00")
booking6  = Booking.create(user_id: elle.id, clinic_id: east.id, price: 10, reason: "I have ADHD.", day: "Tuesday", time: "12.00")
booking7  = Booking.create(price: 20, reason: nil, day: "Tuesday", time: "13.00")
booking8  = Booking.create(price: 30, reason: nil, day: "Tuesday", time: "14.00")
booking9  = Booking.create(price: 40, reason: nil, day: "Tuesday", time: "15.00")
booking10 = Booking.create(price: 50, reason: nil, day: "Tuesday", time: "16.00")
booking11 = Booking.create(user_id: ivan.id, clinic_id: west.id, price: 10, reason: "My eyes hurt", day: "Wednesday", time: "12.00")
booking12 = Booking.create(price: 20, reason: nil, day: "Wednesday", time: "13.00")
booking13 = Booking.create(price: 30, reason: nil, day: "Wednesday", time: "14.00")
booking14 = Booking.create(price: 40, reason: nil, day: "Wednesday", time: "15.00")
booking15 = Booking.create(price: 50, reason: nil, day: "Wednesday", time: "16.00")
booking16 = Booking.create(user_id: patrick.id, clinic_id: south.id, price: 10, reason: "I'm just passing the time really", day:"Thursday", time: "12.00")
booking17 = Booking.create(price: 20, reason: nil, day: "Thursday", time: "13.00")
booking18 = Booking.create(price: 30, reason: nil, day: "Thursday", time: "14.00")
booking19 = Booking.create(price: 40, reason: nil, day: "Thursday", time: "15.00")
booking20 = Booking.create(price: 50, reason: nil, day: "Thursday", time: "16.00")
booking21 = Booking.create(user_id: elle.id, clinic_id: east.id, price: 10, reason: "People say I smell...", day: "Friday", time: "12.00")
booking22 = Booking.create(price: 20, reason: nil, day: "Friday", time: "13.00")
booking23 = Booking.create(price: 30, reason: nil, day: "Friday", time: "14.00")
booking24 = Booking.create(price: 40, reason: nil, day: "Friday", time: "15.00")
booking25 = Booking.create(price: 50, reason: nil, day: "Friday", time: "16.00")
