require 'sendgrid-ruby'
require 'dotenv'
Dotenv.load
include SendGrid

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

emails = [ENV['EMAIL_JENNY'], ENV['EMAIL_JOE'], ENV['EMAIL_KATIE'],
          ENV['EMAIL_SAM'], ENV['EMAIL_DAD'], ENV['EMAIL_MUM']]
givers = %w[Jenny Joe Katie Sam Dad Mum]
partners = %w[Daniel Viktor Rob Cat]
takers = santa_shuffle(givers)
takers2 = santa_shuffle(partners)

puts 'Names generated!'

i = 0
while i < givers.length
  takers_string = "#{takers[i]}#{" and #{takers2[i]}" if i < partners.length}"
  from = Email.new(email: ENV['EMAIL_JOE'])
  to = Email.new(email: emails[i])
  subject = 'Secret Santa Names'
  content = Content.new(type: 'text/plain',
                        value: "Hi #{givers[i]}! You're buying for #{takers_string}. Love, Santa")
  mail = Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts "Email sent to #{givers[i]}!" if response.status_code == '202'
  i +=1
end

puts 'Merry Christmas!'
