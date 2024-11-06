class Prediction < ApplicationRecord
  belongs_to :answer

  LIMIT_PREDICTIONS_FOR_SHOW = 10

  scope :for_show, -> { order(created_at: :desc).limit(LIMIT_PREDICTIONS_FOR_SHOW) }
end
