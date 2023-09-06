class Staff < SaposModels

  has_many :supervised, :class_name => "Student", :foreign_key => :supervisor

end