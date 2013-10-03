class Upload

  include ActiveModel::Model

  attr_accessor :name, :email, :organization, :csv

  validates_presence_of :name, :csv
  validates :email, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      instance_variable_set "@#{name}", value
    end
  end

  def persisted?
    false
  end

end
