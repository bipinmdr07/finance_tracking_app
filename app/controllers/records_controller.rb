class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    if @record.valid?
      redirect_to root_path
    else
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to root_path
    else
      redirect_to edit_record_path
    end
  end

  def destroy
    Record.find(params[:id]).destroy
  end

  private

  def record_params
    params.require(:record).permit(:title, :date, :amount)
  end
end
