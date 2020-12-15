class Admin::ItemsController < ApplicationController

def index
    if params[:search].present?
      @products = Product.where('name LIKE ?',"%#{params[:search]}%")
    else
      @products = Product.all
    end
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
