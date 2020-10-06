CRUD for doctors and patients.
Update patients with doctor id
Class doctorsoffice?

class Doctor 
  attr_accessor(:id,:name,:specialty)

  def intitialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  def ==(doctor_to_compare)
    self.name() == doctor_to_compare.name()
  end
end