class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @new_group = NewGroupForm.new(Group.new)
  end

  def create
    @new_group = NewGroupForm.new(Group.new)
    if @new_group.validate(new_group_params)
      @new_group.save
      redirect_to(group_path(@new_group))
    else
      redirect_to root_path, flash: { error: @new_group.errors.full_messages.join(', ')}
    end
  end

  def show
    @groups = Group.all
    @group =  Group.find(params[:id])
    gon.tok_token = VideoOpenTok.generate_token(@group.session_id)
    gon.tok_session_id = @group.session_id
    gon.tok_api_key = VideoOpenTok.api_key
  end

  private

  def new_group_params
    params.require(:new_group).permit(:name)
  end

end
