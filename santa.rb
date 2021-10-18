require 'pony'

emails = %w[len.rohde@bt.com
            rohdejenny@gmail.com
            joseph.jf.rohde@gmail.com
            kateinaus@gmail.com
            itsmechrisrohde@gmail.com
            1989sam.r@gmail.com]
givers = %w[Dad Jenny Joe Katie Mum Sam]
partners = %w[Daniel Viktor Rob Cat]
takers = givers.shuffle
i = 0

while i < takers.length
  if givers[i] == takers[i]
    takers = givers.shuffle
    i = 0
  end
  i += 1
end

p givers
p takers

givers2 = givers
givers2.delete('Mum')
givers2.delete('Dad')

takers2 = partners.shuffle
i = 0

while i < takers2.length
  if partners[i] == takers2[i]
    takers2 = partners.shuffle
    i = 0
  end
  i += 1
end

p givers2
p takers2

Pony.mail(:to => emails[2], :body => "You get to buy for #{takers[2]} and #{takers2[2]}")
