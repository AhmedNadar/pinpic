class RemoveUserIndexFromPins < ActiveRecord::Migration
  def change
    remove_index(:pins, :name => 'index_pins_on_user_id')
  end
end
