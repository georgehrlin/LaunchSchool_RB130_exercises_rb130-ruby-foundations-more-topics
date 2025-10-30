require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Test < Minitest::Test
  def test_employee_hire_raises_NoExperienceError
    employee = Object.new
    # assert_raises(NoExperienceError, employee.hire) # Wrong
    assert_raises(NoExperienceError) { employee.hire } # Correction
  end

  # By Nick Johnson
  def tet_no_experience_error
    employee = 'employee'
    employee.define_singleton_method(:hire) { raise NoExperienceError }
    assert_raises(NoExperienceError) { employee.hire }
  end
end
