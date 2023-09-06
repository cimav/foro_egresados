class Student < SaposModels

  has_one :these  # These.student_id
  belongs_to :area
  belongs_to :staff_supervisor, :foreign_key => "supervisor", :class_name => "Staff"
  belongs_to :program

  def full_name
    "#{self.first_name} #{self.last_name} #{self.last_name2}".titleize rescue "--"
  end

  def these_title
    these.title rescue 'Sin trabajo de tesis' rescue "--"
  end

  def these_defence_date
    these.defence_date.strftime("%d/%m/%Y") rescue 'Sin fecha de defensa'
  end

  def full_supervisor
    "#{staff_supervisor.first_name} #{staff_supervisor.last_name}".titleize rescue 'Sin director'
  end

  def full_program
    "#{program.prefix} #{program.name}" rescue "--"
  end

  def full_area
    "#{area.name}" rescue "--"
  end

  def campus
    case self.campus_id
    when 1
      "Chihuahua"
    when 2
      "Monterrey"
    when 3
      "Juárez"
    when 4
      "Durango"
    else
      "Desconocido"
    end
  end

  def display_url
    "http://posgrado.cimav.edu.mx/imagen/student/#{self.id}"
  end

end