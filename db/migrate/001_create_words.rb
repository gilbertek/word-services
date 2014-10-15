Sequel.migration do
	up do
		create_table :words do
			primary_key :id
			String :body, null: false
			String :exclude, null: false
		end
	end

	down do
		drop_table :words
	end
end