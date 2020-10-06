class Doctor
  attr_accessor :id, :name, :specialty

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctor;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({ :name => name, :id => id, :specialty => specialty }))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctor (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(doctor_to_compare)
    self.name() == doctor_to_compare.name()
  end

  def self.find(id)
    doctor = DB.exec("SELECT * FROM doctor WHERE id = #{id};").first
    if doctor
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      Doctor.new({ :name => name, :id => id, :specialty => specialty })
    else
      nil
    end
  end
  def delete()
    deletequery =DB.exec ("DELETE FROM doctor WHERE id = #{@id};")
  end
end

