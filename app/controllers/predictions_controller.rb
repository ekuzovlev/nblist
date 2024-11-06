class PredictionsController < ApplicationController
  def index
    @predictions = Prediction.includes(:answer).for_show
  end
  def create
    answer = Answer.random_answer
    prediction = Prediction.new
    prediction.answer = answer

    if prediction.save
      render json: { message: "Prediction created successfully!", body: answer.body }, status: :created
    else
      render json: { errors: prediction.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
