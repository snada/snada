class PicsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      render :show
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pic.update_attributes(pic_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_url, notice: 'Pic was successfully destroyed.'
  end

  private
    def pic_params
      params.require(:pic).permit(:upload)
    end
end
