ActiveAdmin.register Product do
	menu priority: 2
	permit_params :title, :description, :author, :available_on, :avatar, :price, :featured

	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do
	    f.input :title
	    f.input :description
	    f.input :author
	    f.input :available_on, :as => :datepicker
	    # f.input :date_end, :as => :date
	    # f.input :place
	    # f.input :map, :as => :file
	    f.input :avatar, :as => :file, :hint => f.template.image_tag(f.object.avatar.url(:medium))
	    # f.input :userfull_info
	    f.input :price
	    f.input :featured
	    # f.input :phone, :as => :phone
	    # f.input :website, :as => :url
	  end
	  f.actions
	 end
	
	scope :all, default: true
	scope :available do |products|
		products.where("available_on < ?", Date.today)
	end

	scope :drafts do |products|
		products.where("available_on > ?", Date.today)
	end

	scope :featured do |products|
		products.where(featured: true)
	end

	index as: :grid	do |product|
		div do
			a href: admin_product_path(product) do
				image_tag("products/" + product.avatar.url)
			end
		end
		a truncate(product.title, href: admin_product_path(product))
	end

	show title: :title

	sidebar :product_stats, only: :show do
		attributes_table_for resource do
			row("Total Sold") { Order.find_with_product(resource).count }
			row("Dollar Value") {number_to_currency LineItem.where(product_id: resource.id).sum(:price)}
		end
	end

	sidebar :recent_orders, only: :show do
		Order.find_with_product(resource).limit(5).collect do |order|
			auto_link(order)
		end.join(content_tag("br")).html_safe
	end

	sidebar "Active Admin Demo" do
		render('/admin/sidebar_links', model: 'products')
	end

end