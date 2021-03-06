class Commit < ActiveRecord::Base
  belongs_to :project
  belongs_to :coder
  belongs_to :org  
  default_scope :order => 'committed_date DESC'
  
  validates_uniqueness_of :sha
  
  def find_or_create(options={})
    commit = Commit.where(:sha => options[:sha]).first
    !commit.blank? ? commit : Commit.create!(options)
  end
    
end