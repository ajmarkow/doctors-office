require ("spec_helper")
require "dotenv"

describe ("#Patient") do
  describe ("#initialize") do
    it("creates a new Patient") do
      testPatient = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => Date.new(1975, 10, 15), :id => nil })
      expect(testPatient.name).to(eq("bob"))
    end
  end

  describe (".all") do
    it("returns an array of Patients") do
      testPatient = Patient.new({ :name => "tim", :doctor_id => nil, :birthdate => Date.new(1975, 10, 15), :id => nil })
      testPatient.save()
      expect(Patient.all).to(eq([testPatient]))
    end
  end

  describe (".save") do
    it("pushes a Patient into the database") do
      testPatient = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => Date.new(1975, 10, 15), :id => nil })
      testPatient.save()
      expect(Patient.all).to(eq([testPatient]))
    end
  end

  describe (".find") do
    it("finds a Patient by id") do
      patient = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => 2020-07-01, :id => nil })
      patient.save()
      patient2 = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => 2020-07-01, :id => nil })
      patient2.save()
      expect(Patient.find(patient.id)).to(eq(patient))
    end
  end

  describe (".delete") do
    it("deletes") do
      testPatient = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => 2020-07-01, :id => nil })
      testPatient.save()
      testPatient.delete()
      expect(Patient.all).to(eq([]))
    end
  end

  describe("#update") do
    it("updates a Patient by id") do
      patient = Patient.new({ :name => "bob", :doctor_id => nil, :birthdate => 2020-07-01, :id => nil })
      patient.save()
      patient.update("Fred")
      expect(patient.name).to(eq("Fred"))
    end
  end
end
