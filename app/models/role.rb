class Role < ActiveRecord::Base
    ROLES = %w{full_access restricted_access}

    has_and_belongs_to_many :admins, :join_table => :admins_roles


    belongs_to :resource,
               :polymorphic => true


    validates :resource_type,
              :inclusion => { :in => Rolify.resource_types },
              :allow_nil => true

    validates :name, inclusion: { in: ROLES }
    scopify
end