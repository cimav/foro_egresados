# frozen_string_literal: true

module Thredded
  module UserPermissions
    module Read
      module None
        extend ActiveSupport::Concern

        # @return [ActiveRecord::Relation<Thredded::Messageboard>] messageboards that the user can post in
        def thredded_can_read_messageboards
          Thredded::Messageboard.none
        end
      end
    end
  end
end
