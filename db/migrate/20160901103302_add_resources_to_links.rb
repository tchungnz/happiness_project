class AddResourcesToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :url_resources, :text, array:true, default: []
  end
end
