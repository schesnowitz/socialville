class AddStuffToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :age, :date
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :alt_email, :string
    
  end
end

# :binary
# :boolean
# :date
# :datetime
# :decimal
# :float
# :integer
# :primary_key
# :references
# :string
# :text
# :time
# :timestamp