require_relative 'employee'

class Manager < Employee
  
  attr_reader :employees
  
  def initialize(name, title, salary, boss = nil)
    super(name, title, salary,boss)
    @employees = []
  end
  
  def set_employee(new_employee)
    @employees << new_employee
    new_employee.boss = self
  end
  
  def bonus(multiplier)
    #total_sum = @employees.reduce{|acc,emp| acc += emp.salary}
    # total_sum = 0
    # @employees.flatten.each do |emp|
    #   total_sum += emp.salary
    # end
    total_sum = Manager.total_sum_rec(employees)
    p total_sum
    @bonus = total_sum * multiplier
  end
  
  def self.total_sum_rec(lis_employees)
    return 0 if lis_employees.empty?
    
    total_sum = 0
    lis_employees.each do |member|
      if member.is_a?(Manager)
        p total_sum
        total_sum += Manager.total_sum_rec(member.employees) + member.salary
      else
        total_sum += member.salary
      end
    end
    total_sum
  end
  
  def inspect
    "#<Manager: #{@name} @boss = #{@boss} employee = #{@employees}>"
  end
  
  # private:
  # attr_reader :employees
end