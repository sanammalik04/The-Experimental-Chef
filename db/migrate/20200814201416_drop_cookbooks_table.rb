class DropCookbooksTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :cookbooks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
