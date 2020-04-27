class DoNotDisturb < ApplicationRecord
    validate :to_time_after_from_time
    validate :check_days


    private
    def to_time_after_from_time
        return if to_time.blank? || from_time.blank?
    
        if to_time < from_time
          errors.add(:to_time, "must be after from time")
        end
    end

   # This function is to check valid day entered by user. If one of the days entered is not valid, will return error 
    def check_days
      return if days.blank?
      day_array = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

      # days - day_array will produce which value that is not included inside day_array. eg ['Monday', 'Fri'] - ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'] = Fri 
      # if value exist, will return error message
      if (days - day_array).present?
        errors.add(:days, "is not included in the list")
      elsif days.size >= 8
        errors.add(:days, "size must be less than 8")
      end     
    end
end
