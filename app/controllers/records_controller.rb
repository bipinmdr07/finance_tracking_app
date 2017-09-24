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
      flash[:success] = 'Record was successfully created!'
    else
      flash[:danger] = 'Seems like you entered an invalid data, Please enter valid one'
      redirect_to new_record_path(@record)
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to root_path
      flash[:success] = 'Record was successfully updated!'
    else
      redirect_to edit_record_path
      flash[:danger] = 'Something went wrong, Please try again'
    end
  end

  def destroy
    Record.find(params[:id]).destroy
    flash[:success] = 'Record was successfully deleted!'
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:title, :date, :amount)
  end
end
