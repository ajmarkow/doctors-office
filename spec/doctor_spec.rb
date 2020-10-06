require ("spec_helper")
require "dotenv"

describe ("#Doctor") do
  describe ("#initialize") do
    it("creates a new doctor") do
      testdoctor = Doctor.new({ :name => "larem", :id => nil, :specialty => "internal medicine" })
      expect(testdoctor.name).to(eq("larem"))
    end
  end

  describe (".all") do
    it("returns an array of doctors") do
      testdoctor = Doctor.new({ :name => "larem", :id => nil, :specialty => "internal medicine" })
      testdoctor.save()
      expect(Doctor.all).to(eq([testdoctor]))
    end
  end

  describe (".save") do
    it("pushes a doctor into the database") do
      testdoctor = Doctor.new({ :name => "larem", :id => nil, :specialty => "internal medicine" })
      testdoctor.save()
      expect(testdoctor.name).to(eq("larem"))
    end
  end

  describe (".find") do
    it("finds a doctor by id") do
      doctor = Doctor.new({ :name => "larem", :id => nil, :specialty => "internal medicine" })
      doctor.save()
      doctor2 = Doctor.new({ :name => "slarem", :id => nil, :specialty => "sinternal medicine" })
      doctor2.save()
      expect(Doctor.find(doctor.id)).to(eq(doctor))
    end

    describe (".delete") do
      it("deletes") do
        testdoctor = Doctor.new({ :name => "larem", :id => nil, :specialty => "internal medicine" })
        testdoctor.save()
        testdoctor.delete()
        expect(Doctor.all).to(eq([]))
      end
    end
  end
end
