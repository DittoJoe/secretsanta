require "mailjet"
require "dotenv"
Dotenv.load

Mailjet.configure do |config|
  config.api_key = ENV["MJ_APIKEY_PUBLIC"]
  config.secret_key = ENV["MJ_APIKEY_PRIVATE"]
  config.api_version = "v3.1"
end

budget = 20
givers = %w[JENNY JOE KATIE SAM DAD MUM]
takers = {}

shuffled_givers = givers.shuffle
shuffled_givers.each_with_index do |giver, index|
  takers[giver] = shuffled_givers[(index + 1) % shuffled_givers.size]
end

puts "Names generated!"

i = 0
while i < givers.length
  giver = givers[i]
  variable = Mailjet::Send.create(messages: [{
    "From"=> {
        "Email"=> ENV["EMAIL_JOE"],
        "Name"=> "Santa"
    },
    "To"=> [
        {
            "Email"=> ENV["EMAIL_#{giver}"],
            "Name"=> giver
        }
    ],
    "Subject"=> "Secret Santa #{Date.today.year}",
    "TextPart"=> "Hi #{giver.capitalize}! This year you'll be buying #{takers[giver].capitalize} a gift for £#{budget} or less. Good luck and have fun!",
  }]
  )
  puts "Email sent to #{giver.capitalize}!" if variable.attributes["Messages"][0]["Status"] == "success"
  i +=1
end
puts "Merry Christmas!"
