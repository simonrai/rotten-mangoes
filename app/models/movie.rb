class Movie < ActiveRecord::Base

  has_many :reviews

	validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_future

  # :scope :ordered_by_release_date, -> { order(release_date: :desc, title: :asc) }

  # :scope :with_director, -> do |director|
  #   where(director: director)
  # end
  
  # :scope :matching_title, -> do |title|
  #   where(...)
  # end 

  mount_uploader :poster, PosterUploader

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end
