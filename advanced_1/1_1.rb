a = [1, 1, 2, 6, 24, 120, 720]
e = a.to_enum
p e.next
p e.next
p e.next
p e.next
p e.next
p e.next

e.rewind

p e.next
p e.next
p e.next

e.rewind

p e.next
p e.next
p e.next
p e.next
p e.next
p e.next
