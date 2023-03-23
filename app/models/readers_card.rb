class ReadersCard < ApplicationRecord
  belongs_to :library
  has_one :user
  has_many :books

  def self.insert_100
    (1..100).each do |x|
      self.new(issue_date: "2023-03-22", library: Library.last).save
    end
  end

  def update_issue_date(issue_date)
    self.issue_date=issue_date
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_library(library)
    self.library=library
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end
end
