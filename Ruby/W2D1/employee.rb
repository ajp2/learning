class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus(multiplier)
    self.total_subsalary * multiplier
  end

  protected
  
  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end
end

shawna = Employee.new("Shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)

darren = Manager.new("Darren", "TA Manager", 78000)
shawna.boss = darren
david.boss = darren

ned = Manager.new("Ned", "Founder", 1000000)
darren.boss = ned


p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)