class ChildrenController < ApplicationController

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to children_path, notice: "#{@child.name} was added!"
    else
      render :new, notice: "#{@child.name} was not added!"
    end
  end

  def show
    @child = Child.find(params[:id])
    @checkpoint = Checkpoint.new
    @checkpoints = @child.checkpoints
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to children_path, notice: "#{@child.name} was removed!"
  end

  private

  def child_params
    params.require(:child).permit(:name, :age)
  end

end
