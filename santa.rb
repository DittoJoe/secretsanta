require "mailjet"
require "dotenv"
Dotenv.load

Mailjet.configure do |config|
  config.api_key = ENV["MJ_APIKEY_PUBLIC"]
  config.secret_key = ENV["MJ_APIKEY_PRIVATE"]
  config.api_version = "v3.1"
end

def santa_shuffle(array)
  i = 0
  result = array
  while i < array.length
    if array[i] == result[i]
      result = array.shuffle
      i = 0
    end
    i += 1
  end
  return result
end

emails = [ENV["EMAIL_JENNY"], ENV["EMAIL_JOE"], ENV["EMAIL_KATIE"], ENV["EMAIL_SAM"], ENV["EMAIL_DAD"], ENV["EMAIL_MUM"]]
givers = %w[Jenny Joe Katie Sam Dad Mum]
takers = santa_shuffle(givers)
budget = 20
puts "Names generated!"

i = 0
while i < givers.length
  variable = Mailjet::Send.create(messages: [{
    "From"=> {
        "Email"=> ENV["EMAIL_JOE"],
        "Name"=> "Santa"
    },
    "To"=> [
        {
            "Email"=> emails[i],
            "Name"=> givers[i]
        }
    ],
    "Subject"=> "Secret Santa #{Date.today.year}",
    "TextPart"=> "Hi #{givers[i]}! This year you'll be buying #{takers[i]} a gift for £#{budget} or less. Good luck and have fun!",
  }]
  )
  puts "Email sent to #{givers[i]}!" if variable.attributes["Messages"][0]["Status"] == "success"
  i +=1
end
puts "Merry Christmas!"
