class CreateCakes < ActiveRecord::Migration[5.2]
  def change
    create_table :cakes do |c|
      c.string :name, :required => true

    end
  end
end
