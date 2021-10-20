require 'pony'

emails = %w[rohdejenny@gmail.com
            joseph.jf.rohde@gmail.com
            kateinaus@gmail.com
            1989sam.r@gmail.com
            len.rohde@bt.com
            itsmechrisrohde@gmail.com]
# emails = []
# 6.times { emails << "joseph.jf.rohde@gmail.com" }

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

# p givers
# p takers

i = 0
while i < takers2.length
  if partners[i] == takers2[i]
    takers2 = partners.shuffle
    i = 0
  end
  i += 1
end

# p givers2
# p takers2

# Pony.mail(:to => emails[1],
#           :from => 'santa@lapland.com',
#           :subject => 'Your Secret Santa names',
#           :body => "Hi #{givers[1]}! You're buying for #{takers[1]} and #{takers2[1]}. Love, Santa"
#           )

i = 0
while i < givers.length
  # Pony.mail(:to => emails[i],
  #           :from => 'santa@lapland.com',
  #           :subject => 'Your Secret Santa names',
  #           :body => "Hi #{givers[i]}! You're buying for #{takers[i]}#{" and #{takers2[i]}" if i < 4}. Love, Santa")
  puts emails[i]
  puts "Hi #{givers[i]}! You're buying for #{takers[i]}#{" and #{takers2[i]}" if i < 4}. Love, Santa"
  i +=1
end
