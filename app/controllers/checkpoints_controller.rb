class CheckpointsController < ApplicationController

  def show
    @child = Child.find(params[:child_id])
    @checkpoint = Checkpoint.find(params[:id])
  end

  def create
    @child = Child.find(params[:child_id])
    @checkpoint = Checkpoint.new(checkpoint_params)
    @checkpoint.child_id = @child.id
    if @checkpoint.save
      redirect_to child_path(@child), notice: "The checkpoint was successfully added!"
    else
      render :new, notice: "The checkpoint was not added!"
    end
  end

  def update
    @child = Child.find(params[:child_id])
    @checkpoint= Checkpoint.find(params[:id])
    if @checkpoint.update(checkpoint_params)
      redirect_to child_path(@child), notice: "The checkpoint edit was completed!"
    else
      render :show
    end
  end

  def destroy
    @child = Child.find(params[:child_id])
    @checkpoint= Checkpoint.find(params[:id])
    @checkpoint.destroy
    redirect_to children_path, notice: "The checkpoint was removed!"
  end

  private

  def checkpoint_params
    params.require(:checkpoint).permit(:checkpoint)
  end

end
