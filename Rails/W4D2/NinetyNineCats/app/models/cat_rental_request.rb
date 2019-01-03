class CatRentalRequest < ApplicationRecord
  STATUS = ["PENDING", "APPROVED", "DENIED"]

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUS
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not("start_date > ? OR end_date < ?", end_date, start_date)
  end

  def does_not_overlap_approved_request
    if overlapping_requests.exists?
      errors[:dates] << "cannot overlap"
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      self.save
      overlapping_pending_requests.each do |request|
        request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end
end