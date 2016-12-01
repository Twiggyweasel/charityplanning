class AddOrgCoverToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :org_cover, :string
  end
end
