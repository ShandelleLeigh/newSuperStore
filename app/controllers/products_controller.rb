class ProductsController < ApplicationController
  before_action :set_department
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = @department.products
    end

    def show
    end

    def new
      @product = @department.products.new
      render partial: "form"
    end

    def edit
      render partial: "form"
    end

    def create
      @product = @department.products.new(product_params)

      if @product.save
        redirect_to [@department, @product]
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to [@department, @product]
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to department_products_path
    end

    private
      def set_department
        @department = Department.find(params[:department_id])
      end

      def set_product
        @product = Produt.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :body)
      end
end
