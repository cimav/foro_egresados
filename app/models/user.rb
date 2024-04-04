class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_reader :student_readable

  NONE = 0

  DOCTORAL  = 1
  POST_DOCTORAL  = 2
  RESIDENT = 3
  ACADEMIC_GRADE = {
      NONE => 'Ninguno',
      DOCTORAL => 'Doctorado',
      POST_DOCTORAL => 'Post-Doctorado',
      RESIDENT => 'Estancia'
  }

  OWNER  = 1
  EMPLOYEE  = 2
  WORK_TYPE = {
      NONE => 'Ninguno',
      OWNER => 'Propietario',
      EMPLOYEE => 'Empleado'
  }

  CANDIDATO = 1
  NIVEL_1 = 2
  NIVEL_2 = 3
  NIVEL_3 = 4
  SNI = {
      NONE => 'Ninguno',
      CANDIDATO => 'Candidato',
      NIVEL_1 => 'Nivel 1',
      NIVEL_2 => 'Nivel 2',
      NIVEL_3 => 'Nivel 3'
  }

  def get_academic_grade
    ACADEMIC_GRADE[academic_grade]
  end

  def get_work_type
    WORK_TYPE[work_type]
  end

  def get_sni
    SNI[sni]
  end

  def student_readable

    _curp = @user.curp.blank? ? :'CURP_EN_BLANCO' : :@user.curp

    Student.includes(:these, :area).where(curp: _curp).last
  end


end
