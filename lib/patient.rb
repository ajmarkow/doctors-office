class Patient
  attr_accessor(:doctor_id, :name, :birthdate, :id)

  def initialize(attributes)
    @doctor_id = attributes.fetch(:doctor_id)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patient;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      doctor_id = patient.fetch("doctor_id").to_i
      birthdate = patient.fetch("birthdate")
      patients.push(Patient.new({ :name => name, :doctor_id => id, :birthdate => birthdate, :id => nil }))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patient (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(patient_to_compare)
    self.name() == patient_to_compare.name()
  end

  def self.find(id)
    patient = DB.exec("SELECT * FROM patient WHERE id = #{id};").first
    if patient
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id").to_i
      Patient.new({ :name => name, :id => id, :birthdate => birthdate, :doctor_id => nil })
    else
      nil
    end
  end

  def delete()
    deletequery = DB.exec ("DELETE FROM patient WHERE id = #{@id};")
  end

  def update(name)
    @name = name
    DB.exec("UPDATE patient SET name = '#{@name}' WHERE id = #{@id};")
  end
end
