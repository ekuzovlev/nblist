class Answer < ApplicationRecord
  has_many :predictions

  def self.random_answer
    order("RANDOM()").first
  end
end
