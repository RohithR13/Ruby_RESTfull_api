class Student < ApplicationRecord
    validates :name, :roll_no, :class_no, :school, presence: true
end
