class CreateRol < ActiveRecord::Migration[5.2]
  def change
    create_table :rol do |t|
      t.string :name

      t.timestamps
    end

    Rol.create(name: :administrador)
    Rol.create(name: :usuario)
  end
end
