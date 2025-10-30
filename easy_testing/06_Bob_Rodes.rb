require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise(NoExperienceError, 'has no experience')
  end
end

# By Bob Rodes
class EmployeeTest < Minitest::Test
  def test_employee_hire_raises_NoExperienceError
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire } # This should pass
  end
end
