class Patient
  attr_accessor(:id,:name,:birthdate,:doctor_id)

  def initialize(attributes)
    @id = attributes.fetch(:doctor_id)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:name)
    @doctor_id = attributes.fetch(:doctor_id)
  end
end
