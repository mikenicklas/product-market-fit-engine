class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = current_user.build_product
  end

  def create
    @product = current_user.build_product(product_params)
    if @product.save
      redirect_to root_path, flash: { success: "Your account has been setup!" }
    else
      render :new, flash: { error: "Your account could not be setup!" }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :logo_url, :public_contact_email, :site_url)
  end

end
