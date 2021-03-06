module MyZipcodeGem
  class ModelsGenerator < Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def initialize(*args, &block)
      super
      migration_template 'migration.rb', "db/migrate/create_my_zipcode_gem_models.rb"
    end

    def generate_models
      # puts ">>> generate_zipcodes:"
    end

    def add_gems
      add_gem "mocha", :group => :test
    end

    def create_models
      template 'zipcode_model.rb', "app/models/zipcode.rb"
      template 'county_model.rb', "app/models/county.rb"
      template 'state_model.rb', "app/models/state.rb"
    end

    # Implement the required interface for Rails::Generators::Migration.
    # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    # def create_migration
    #  migration_template 'migration.rb', "db/migrate/create_my_zipcode_gem_models.rb"
    # end

    def create_rakefile
      template 'zipcodes.rake', "lib/tasks/zipcodes.rake"
    end

  end
end
