$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('./support/dummy_model', __FILE__)
require 'string_attributes'
require 'active_record'
require 'support/dummy_model/user'

ActiveRecord::Base.send(:include, StringAttributes::Base)
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

RSpec.configure do |config|
  config.before :all do
    ActiveRecord::Schema.define(version: 1) do
      create_table :users do |t|
        t.string :name
      end
    end
  end

  config.after :all do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end
end
