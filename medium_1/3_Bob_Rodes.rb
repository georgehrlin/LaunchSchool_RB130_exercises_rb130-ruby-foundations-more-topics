def gather(items)
  yield(items)
end

gather(['apples', 'corn', 'cabbage', 'wheat']) do |items|
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end
