class Admin::ItemsController < ApplicationController
def index
    @products = Product.all
end

def new
    @product = Product.new
end

def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to admin_item_path(@product)
    else
      render 'new'
    end
end

def show
    @product = Product.find(params[:id])
end

# 商品編集画面
def edit
end

# 商品情報の更新
def update
end

private

def product_params
    params.require(:product).permit(:name, :price, :genre_id, :explanation, :is_sold, :image)
end
end
