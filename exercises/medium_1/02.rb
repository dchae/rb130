class TextAnalyzer
  def process
    yield(File.open("text.txt", "r") { |f| f.read })
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts %w[\n\n \n \s+].map { |term| text.split(/#{term}/).size }.zip(%w[paragraphs lines words]).map { |x| x.join(" ")}.join("\n") }