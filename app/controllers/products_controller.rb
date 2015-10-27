class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:title, :description, :author, :price, :featured, :available_on)
    end
end

