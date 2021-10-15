emails = %w[len.rohde@bt.com rohdejenny@gmail.com joseph.jf.rohde@gmail.com kateinaus@gmail.com itsmechrisrohde@gmail.com 1989sam.r@gmail.com]
givers = %w[Dad Jenny Joe Katie Mum Sam]
partners = %w[Daniel Viktor Rob Kat]
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

givers.delete('Mum')
givers.delete('Dad')

takers = partners.shuffle
i = 0

while i < takers.length
  if partners[i] == takers[i]
    takers = partners.shuffle
    i = 0
  end
  i += 1
end

p givers
p takers
