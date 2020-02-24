class QuestionsController < ApplicationController
  ANSWERS = {
    upcase: 'I can feel your motivation!',
    downcase: {
      1 => 'Great!',
      2 => 'Silly question, get dressed and go to work!',
      3 => 'I dont care, get dressed and go to work!'
    }
  }

  def ask
    @question = params[:question]
  end

  def answer
    @answers = ANSWERS
    @question = params[:question]
  end
end
