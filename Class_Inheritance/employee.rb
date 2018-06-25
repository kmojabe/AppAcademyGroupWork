class Employee
  attr_accessor :boss
  attr_reader :salary
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    @bonus = salary * multiplier
  end
  # def boss=(val)
  #   @boss = val
  # end
  def inspect
    "#<Employee: #{@name} @boss = #{@boss} "
  end
  private
  attr_reader :name, :title
end
  