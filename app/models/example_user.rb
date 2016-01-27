class ExampleUser < ActiveRecord::Base
  default_scope { where(is_available: true) }
end
