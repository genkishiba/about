class WishListsController < ApplicationController
  before_action :find_wish_list, only: [:show, :edit, :update, :destroy]
    def index
        @wish_lists = WishList.all
    end

    def new
      @wish_list = WishList.new
    end

    def create
      @wish_list = WishList.new(wish_list_params)
      if @wish_list.save
        redirect_to root_path, notice: "成功新增許願卡"
      else
        render :new
      end
    end
    def show
    end

    def edit
    end

    def update
      if @wish_list.update(wish_list_params)
        redirect_to root_path, notice: "更新成功"
      else
        render :edit
      end
    end

    def destroy
      @wish_list.destroy
      redirect_to root_path, notice: "刪除成功"
    end
   
    private
    def find_wish_list
      @wish_list = WishList.find(params[:id])
    end

    def wish_list_params
      params.require(:wish_list).permit(:title, :description)
    end
end


