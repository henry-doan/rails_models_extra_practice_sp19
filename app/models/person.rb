class Person < ApplicationRecord
  # Assoc
  # Validations
  validates :age, numericality: {
    less_than_or_equal_to: 150,
    greater_than_or_equal_to: 18
  } 

  validates :alive, inclusion: {
    in: %w ( true, false),
    message: "%{value} is invaild"
  }

  validates :gender, :name, :age, :alive, presence: true

  validates :hair_color, :eye_color, allow_blank: true

  validates :name, uniqueness: true
  # Methods

  #class methods
    #callback
    # before_validation
    # after_validation
    # before_save
    # around_save
    # before_create
    # around_create
    # after_create
    # after_save

    def self.order_age
      order(age: :desc)
    end
    
    # instance methods
    before_create :set_alive
  
    def set_alive
      self.alive = true
    end
  end
