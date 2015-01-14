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
#    @checkpoints = @child.checkpoints.where("DATE(created_at) = ?", Date.today)
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to children_path, notice: "The child edit was completed!"
    else
      render :edit
    end
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
