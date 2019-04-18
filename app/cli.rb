class CLI

  attr_accessor :appointments

  def initialize
    @prompt = TTY::Prompt.new
    @appointments = { "Monday" => Booking.all.select{|booking| booking.day == "Monday" && booking.user_id.nil?  && booking.clinic_id.nil? }.map(&:time),
                      "Tuesday" => Booking.all.select{|booking| booking.day == "Tuesday" && booking.user_id.nil?  && booking.clinic_id.nil? }.map(&:time),
                      "Wednesday" => Booking.all.select{|booking| booking.day == "Wednesday" && booking.user_id.nil?  && booking.clinic_id.nil? }.map(&:time),
                      "Thursday" => Booking.all.select{|booking| booking.day == "Thursday" && booking.user_id.nil?  && booking.clinic_id.nil? }.map(&:time),
                       "Friday" => Booking.all.select{|booking| booking.day == "Friday" && booking.user_id.nil?  && booking.clinic_id.nil? }.map(&:time)
                      }

    @available_app_price = { "Monday" => Booking.all.select{|booking| booking.day == "Monday" && booking.user_id.nil?}.map(&:price),
                      "Tuesday" => Booking.all.select{|booking| booking.day == "Tuesday" && booking.user_id.nil?}.map(&:price),
                      "Wednesday" => Booking.all.select{|booking| booking.day == "Wednesday" && booking.user_id.nil?}.map(&:price),
                      "Thursday" => Booking.all.select{|booking| booking.day == "Thursday" && booking.user_id.nil?}.map(&:price),
                      "Friday" => Booking.all.select{|booking| booking.day == "Friday" && booking.user_id.nil?}.map(&:price)
                      }

  end

  def print_title
     app_title = Artii::Base.new :font => 'colossal'
     puts '-----------------------------------------------------------------------------------------------------------------------------'
     puts ''
     puts ''
     puts app_title.asciify('    B o o k D o c    ').colorize(:color => :blue)
     puts '-----------------------------------------------------------------------------------------------------------------------------'

     app_title
   end


  #----sign in---

    # enter email address to signin

  def find_or_create_user

    email = @prompt.ask("Welcome, please enter your email address: ")
    @user = User.find_or_create_by(email_address: email)

    if @user.created_at
      initial_options
    else
      new_user_data
    end

  end




  #----if no account present---

    #Ask series of questions gathering user data: name, postcode, dob, bank_account deposit.
    #Add data to new user

  def new_user_data

      hash = @prompt.collect do
        key(:name).ask("Please tell us your name:", required: true)
        key(:postcode).ask("Please tell us your postcode:", required: true)
        key(:dob).ask("Please tell us your Date of Birth (DD/MM/YYYY):", required: true)
        key(:bank_account).ask("Please tell us how much you would like to credit your account by (digits only):", required: true)
      end

      hash[:email_address] = @user.email_address

    @user = User.find_or_create_by(hash)
    initial_options
  end


#----Post signin/signup **---

  #list of options: book an appointment, view balance, (top up balance)
  def initial_options
    initial_response = @prompt.select("Please choose one of the following options:", ["Book an appointment", "View balance", "exit"])

    if initial_response == "Book an appointment"
      find_clinics
    elsif initial_response == "View balance"
      view_balance
    elsif initial_response == "exit"
      return nil
    end
  end



#----view balance---

  #show balance
  #back to list of options above

  def view_balance
    puts "Your current balance is (£): #{@user.bank_account}"

    initial_options
  end


#----choose clinic---

  #option of available clinics in your area, via postcode.

  def find_clinics

    user_postcode_search = @user.postcode.upcase[0]

    @all_clinics = Clinic.all.select do |clinic|
      clinic.postcode[0] == user_postcode_search
    end

    clinic_choices = @all_clinics.map{|clinic| clinic.clinic_name}

    @chosen_clinic = @prompt.select("Please select your desirable clinic:", clinic_choices)

    make_booking
  end

  def display_availabilities
    puts "availability booking"

  end


  def available_bookings_table

      rows = []
      rows << ["Monday\nTime\nPrice(£)", "\n#{@appointments["Monday"][0]}\n#{@available_app_price["Monday"][0]}", "\n#{@appointments["Monday"][1]}\n#{@available_app_price["Monday"][1]}", "\n#{@appointments["Monday"][2]}\n#{@available_app_price["Monday"][2]}", "\n#{@appointments["Monday"][3]}\n#{@available_app_price["Monday"][3]}", "\n#{@appointments["Monday"][4]}\n#{@available_app_price["Monday"][4]}"]
      rows << ["Tuesday\nTime\nPrice(£)", "\n#{@appointments["Tuesday"][0]}\n#{@available_app_price["Tuesday"][0]}", "\n#{@appointments["Tuesday"][1]}\n#{@available_app_price["Tuesday"][1]}", "\n#{@appointments["Tuesday"][2]}\n#{@available_app_price["Tuesday"][2]}", "\n#{@appointments["Tuesday"][3]}\n#{@available_app_price["Tuesday"][3]}", "\n#{@appointments["Tuesday"][4]}\n#{@available_app_price["Tuesday"][4]}"]
      rows << ["Wednesday\nTime\nPrice(£)", "\n#{@appointments["Wednesday"][0]}\n#{@available_app_price["Wednesday"][0]}", "\n#{@appointments["Wednesday"][1]}\n#{@available_app_price["Wednesday"][1]}", "\n#{@appointments["Wednesday"][2]}\n#{@available_app_price["Wednesday"][2]}", "\n#{@appointments["Wednesday"][3]}\n#{@available_app_price["Wednesday"][3]}", "\n#{@appointments["Wednesday"][4]}\n#{@available_app_price["Wednesday"][4]}"]
      rows << ["Thursday\nTime\nPrice(£)", "\n#{@appointments["Thursday"][0]}\n#{@available_app_price["Thursday"][0]}", "\n#{@appointments["Thursday"][1]}\n#{@available_app_price["Thursday"][1]}", "\n#{@appointments["Thursday"][2]}\n#{@available_app_price["Thursday"][2]}", "\n#{@appointments["Thursday"][3]}\n#{@available_app_price["Thursday"][3]}", "\n#{@appointments["Thursday"][4]}\n#{@available_app_price["Thursday"][4]}"]

      rows << ["Friday\nTime\nPrice(£)", "\n#{@appointments["Friday"][0]}\n#{@available_app_price["Friday"][0]}", "\n#{@appointments["Friday"][1]}\n#{@available_app_price["Friday"][1]}", "\n#{@appointments["Friday"][2]}\n#{@available_app_price["Friday"][2]}", "\n#{@appointments["Friday"][3]}\n#{@available_app_price["Friday"][3]}", "\n#{@appointments["Friday"][4]}\n#{@available_app_price["Friday"][4]}"]

      table = Terminal::Table.new :title => "Available appointments".colorize(:red), :rows => rows, :style => {:width => 100, :padding_left => 3, :border_x => "=", :border_i => "x"}

      table.align_column(0, :center)
      table.align_column(1, :center)
      table.align_column(2, :center)
      table.align_column(3, :center)
      table.align_column(4, :center)
      table.align_column(5, :center)
      table.style = {:all_separators => true}
      puts table

    end


# --- chosen clinic –––

  #pick available bookings
  #more info on available booking, reveal: Dr name, date, time, price.
  #booked and transaction left user account.
  #confirmation message confirming: booking and cost.

# --- back to Post signin/signup options ** ---


def make_booking
  available_bookings_table
    @day = @prompt.select("What day would you like to book an appointment?", @appointments.select {|day, appointments| appointments.length > 0}.keys)
    @time = @prompt.select("What time is your booking?", @appointments[@day])


      @relevant_booking = Booking.all.select{ |booking| booking.day == @day && booking.time == @time}.first

      clinic = Clinic.find_by(clinic_name: @chosen_clinic)

      @relevant_booking.user_id = @user.id
      @relevant_booking.clinic_id = clinic.id
      @relevant_booking.day = @day
      @relevant_booking.time = @time
      @relevant_booking.save

      reason_for_booking
end

def reason_for_booking

  reason = @prompt.ask("May we ask the reason for your booking?", required: true)
  @relevant_booking.reason = reason
  @relevant_booking.save

  confirm_booking
end

          def booking_preview

            rows = []
            rows << ['', '']
            rows << ['Name', @relevant_booking.user.name ]
            rows << ['Clinic', @relevant_booking.clinic.clinic_name]
            rows << ['Appointment', "#{@relevant_booking.day} #{@relevant_booking.time}"]
            rows << ['Reason', "#{@relevant_booking.reason}"]
            rows << ['Price of appointment (£)', "#{@relevant_booking.price}"]
            rows << ['', '']

            table = Terminal::Table.new :title => "Booking Preview".colorize(:blue), :rows => rows, :style => {:width => 70, :padding_left => 3, :border_x => "=", :border_i => "x"}

            puts table
          end


def confirm_booking
  booking_preview
  response = @prompt.select("Please confirm or cancel you booking below:", ["Confirm", "Cancel"])

  if response == "Confirm"
    @appointments[@day].delete(@time)
    booking_confirmation
  else

    initial_options
  end
end


def booking_confirmation

  price_of_booking = @relevant_booking.price
  @user.bank_account = @user.bank_account - price_of_booking
  @user.save

  rows = []
  rows << ['', '']
  rows << ['Name', @relevant_booking.user.name ]
  rows << ['Clinic', @relevant_booking.clinic.clinic_name]
  rows << ['Appointment', "#{@relevant_booking.day} #{@relevant_booking.time}"]
  rows << ['Price of appointment (£)', "#{@relevant_booking.price}" ]
  rows << ['Remaining balance (£)', "#{@user.bank_account}"]
  rows << ['', '']

  table = Terminal::Table.new :title => "Booking Confirmation".colorize(:green), :rows => rows, :style => {:width => 70, :padding_left => 3, :border_x => "=", :border_i => "x"}

  puts table

  response = @prompt.select("", ["Return to options", "exit"])
    if response == "Return to options"
      initial_options
    else
      return nil
    end

end


# def booking_confirmation
#
# price_of_booking = @relevant_booking.price
# @user.bank_account = @user.bank_account - price_of_booking
# @user.save
#
# puts "#{@user.name} your appointment is on #{@day} at #{@time}. The cost of this appointment is £#{price_of_booking}."
# puts "Your remaining balance is £#{@user.bank_account}."
#
# end





#---Run method ---

    def run
      print_title
      find_or_create_user
    end
end
