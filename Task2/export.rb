module ExportCsv

  module ClassMethods

   def save_to_csv
     require "csv"
     CSV.open('users.csv', 'w') do |csv|
      all.each { |user| csv << user }
    end
    end

    def all
     ObjectSpace.each_object(self).map(&:create)
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
