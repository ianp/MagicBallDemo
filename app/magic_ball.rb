class MagicBall

  def initialize
    @answers = MainBundle.loadJSON('answers')
  rescue NSBundleLoadingError => error
    $stderr.puts "Error: #{error.description}"
    @answers = ['Yes', 'No', 'Maybe', 'Try Again']
  end

  def answer
    @answers.sample
  end

end

