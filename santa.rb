require 'sendgrid-ruby'
include SendGrid

# emails = %w[rohdejenny@gmail.com joseph.jf.rohde@gmail.com kateinaus@gmail.com
#             1989sam.r@gmail.com len.rohde@bt.com itsmechrisrohde@gmail.com]
emails = []
6.times { emails << "joseph.jf.rohde@gmail.com" }

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
  puts emails[i]
  puts "Hi #{givers[i]}! You're buying for #{takers[i]}#{" and #{takers2[i]}" if i < 4}. Love, Santa"
  i +=1
end

