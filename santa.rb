require 'sendgrid-ruby'
require 'dotenv'
Dotenv.load
include SendGrid

p ENV['SENDGRID_API_KEY']
p ENV['EMAIL']

emails = [ENV['EMAIL_JENNY'], ENV['EMAIL_JOE'], ENV['EMAIL_KATIE'],
          ENV['EMAIL_SAM'], ENV['EMAIL_DAD'], ENV['EMAIL_MUM']]

# emails = []
# 6.times { emails << ENV['EMAIL_JOE'] }

p emails

givers = %w[Jenny Joe Katie Sam Dad Mum]
givers2 = %w[Jenny Joe Katie Sam]
partners = %w[Daniel Viktor Rob Cat]
takers = givers.shuffle
takers2 = partners.shuffle

i = 0
while i < takers.length
  if givers[i] == takers[i]
    takers = givers.shuffle
    i = 0
  end
  i += 1
end

i = 0
while i < takers2.length
  if partners[i] == takers2[i]
    takers2 = partners.shuffle
    i = 0
  end
  i += 1
end

i = 0
while i < givers.length
  # from = Email.new(email: 'joseph.jf.rohde@gmail.com')
  # to = Email.new(email: emails[i])
  # subject = 'Secret Santa Names'
  # content = Content.new(type: 'text/plain', value: "Hi #{givers[i]}! You're buying for #{takers[i]}#{" and #{takers2[i]}" if i < 4}. Love, Santa")
  # mail = Mail.new(from, subject, to, content)
  # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  # response = sg.client.mail._('send').post(request_body: mail.to_json)
  # puts emails[i]
  # puts "Hi #{givers[i]}! You're buying for #{takers[i]}#{" and #{takers2[i]}" if i < 4}. Love, Santa"
  i +=1
end

