class CheckpointsController < ApplicationController

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

  private

  def checkpoint_params
    params.require(:checkpoint).permit(:checkpoint)
  end

end
