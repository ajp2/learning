class CatRentalRequest < ApplicationRecord
  STATUS = ["PENDING", "APPROVED", "DENIED"]

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUS
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where("start_date BETWEEN ? AND ?", self.start_date, self.end_date)
      .or(CatRentalRequest
        .where("end_date BETWEEN ? AND ?", self.start_date, self.end_date))
      .or(CatRentalRequest
        .where("start_date <= ? AND end_date >= ?", self.start_date, self.end_date))

    # CatRentalRequest we are trying to validate should not appear
    # should work for saved and unsaved records
  end

  def does_not_overlap_approved_request
    if overlapping_requests.exists?
      errors[:dates] << "cannot overlap"
    end
  end

  def overlapping_pending_requests
    overlapping_requests
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      self.save
      deny!
    end
  end

  def deny!
    overlapping_requests.each do |request|
      request.status = "DENIED"
    end
  end
end