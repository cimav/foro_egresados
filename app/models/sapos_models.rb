class SaposModels < ActiveRecord::Base

  establish_connection :"sapos_production"

  self.abstract_class = true

end
