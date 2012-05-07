class MagicBall

  def initialize
    @answers, error = NSBundle.mainBundle.loadJSON('answers')
    unless @answers
      $stderr.puts "Error: #{error.description}"
      @answers = ['Yes', 'No', 'Maybe', 'Try Again']
    end
  end

  def answer
    @answers.sample
  end

end

