class OnboardJudging < ActiveRecord::Base
  has_paper_trail

  belongs_to :participant
  validates :participant, uniqueness: true
  validates :score, :minutes_elapsed, :seconds_elapsed, presence: true
  validates :minutes_elapsed, numericality: {
    greater_than_or_equal_to: 0 }
  validates :seconds_elapsed, numericality: {
    less_than_or_equal_to: 59,
    greater_than_or_equal_to: 0 }

  before_validation :set_score

  def creator
    user_id = versions.find_by(event: 'create').whodunnit
    User.find_by id: user_id if user_id
  end

  private

  # rubocop:disable Metrics/AbcSize
  def set_score
    score = 50
    score -= missed_turn_signals
    score -= 3 * missed_horn_sounds
    score -= 3 * missed_flashers
    score -= 3 * times_moved_with_door_open
    score -= 10 * unannounced_stops
    score -= sudden_stops
    score -= sudden_starts
    score -= abrupt_turns
    if minutes_elapsed >= 7
      score -= 60 * (minutes_elapsed - 7) + seconds_elapsed
    end
    assign_attributes score: score
  end
  # rubocop:enable Metrics/AbcSize
end
