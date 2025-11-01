class TextAnalyzer
  def process
    text = File.open('sample_text.txt')
    yield(text.read)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.count("\n") + 1} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }

# Note
# I didn't know how come text.count("\n") and text.count("\n\n") return the
# same value, so I couldn't figure out how to count the number of paragraphs
# and turned to Grok for help.

# Improved After LSBot Review
class TextAnalyzer
  def process
    yield(File.read('sample_text.txt'))
  end
end

# By Wendy Kuhn
class TextAnalyzer
  def process(&block)
    File.open('sample.txt', &block)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |f| puts "#{f.read.split(/\n{2}/)}.count} paragraphs" }
analyzer.process { |f| puts "#{f.read.split(/\n/)}.count} lines" }
analyzer.process { |f| puts "#{f.read.split.count} words" }

# Official Solution
class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.split("\n").count} lines"}
analyzer.process { |text| puts "#{text.split(' ').count} words"}
