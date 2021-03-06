class Counttype < ApplicationRecord
    def self.import(file, current_user)

        require 'csv'

        CSV.foreach(file.path, headers: true) do |row|
    
          counttype = new
          counttype.attributes = row.to_hash.slice(*updatable_attributes)
          counttype.user_id = current_user.id
          counttype.save!
        end
    end
    
    def self.updatable_attributes
        ["counttype"]
    end
end
