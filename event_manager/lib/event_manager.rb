require 'csv'
require "erb"
require 'google/apis/civicinfo_v2'

#methods
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phonenumbers(phonenumbers)
    phone= []
    only_numbers=phonenumbers.to_s.split("").select {| x | x unless x == " " || x == "-" || x == "." || x== "(" || x == ")"}
    only_numbers.each do |x|
      phone.push(x)
    end
    
    if phone.length < 10 || phone.length > 11
      phonenumber= "Not a valid number"
    elsif phone[0] != "1" && phone.length == 11
      phonenumber= "Not a valid number"
    elsif phone[0] == "1" && phone.length == 11
     phone = phone.pop(10).join("")
    else
      phone.join("")
    end

  end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def count_frequency(array)
  array.max_by {|a| array.count(a)}
  # arr = Hash.new(0)
  # array.each { |a| arr[a]+=1}
  # array.uniq.map{ |n| array.count(n)}.max
end


#methods are all above this line

puts 'EventManager initialized.'

contents = CSV.open '../event_attendees.csv', headers: true, header_converters: :symbol
contents_size = CSV.read('../event_attendees.csv').length
template_letter = File.read "../form_letter.erb"
erb_template = ERB.new template_letter
contents_size-=1
hour_of_day = Array.new(contents_size)
day_of_week = Array.new(contents_size)
j=0
cal = {0=>"sunday",1=>"monday",2=>"tuesday",3=>"wednesday",4=>"thursday",5=>"friday",6=>"saturday"}
contents.each do |row|
  reg_date = row[:regdate]
  reg_date_to_print = DateTime.strptime(reg_date,"%m/%d/%y %H:%M")
  hour_of_day[j] = reg_date_to_print.hour
  day_of_week[j] = reg_date_to_print.wday
  j+=1
  puts reg_date_to_print
end

puts "Most Active Hour is : #{count_frequency(hour_of_day)}"
puts "Most Active Day is : #{cal[count_frequency(day_of_week)].capitalize}"

