class Task < ActiveRecord::Base
  belongs_to :room

  def completed?
    !completed_at.blank?
  end
end
