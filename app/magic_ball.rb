class MagicBall

  def initialize
    json, error = JSON.loadResource('answers')
    if error
      $stderr.puts "Error: #{error.description}"
    else
      @answers = json
    end
    @answers = ['Yes', 'No', 'Maybe', 'Try Again'] unless @answers
  end

  def answer
    @answers.sample
  end

private

  

end

