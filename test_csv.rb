require "./hash_compare.rb"

h = HashCompare.new
h.from_csv 'something.csv', 'newthing.csv', '#!', 1
p h.unchanged
p h.changed
p h.newly_added
p h.deleted
