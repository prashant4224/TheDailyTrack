ActiveAdmin.register User, as: "Customer" do	
	
	menu priority: 4
	config.batch_actions = true

	filter :name
	filter :email
	filter :created_at

	index do
		selectable_column
		id_column
		column :name
		column :email
		column :created_at
		actions
	end

	show title: :name do
		panel "Order History" do
			table_for(customer.orders) do
				column("Order", sortable: :id) {|order| link_to "##{order.id}", admin_order_path(order)}
				column("State") {|order| status_tag(order)}
				column("Date", sortable: :checked_out_at) {|order| pretty_format(order.checked_out_at)}
				column("Total") {|order| number_to_currency(order.total_price)}
			end
		end
	end

	sidebar "Customer Datils", only: :show do
		attributes_table_for customer, :name, :email, :created_at
	end

	sidebar "Order History", only: :show do
		attributes_table_for customer do
			row("Total Orders") {customer.orders.complete.count}
			row("Total Value") {number_to_currency customer.orders.complete.sum(:total_price)}
		end
	end

	sidebar "Active Admin Demo" do
		render('/admin/sidebar_links', model: "users")
	end

end