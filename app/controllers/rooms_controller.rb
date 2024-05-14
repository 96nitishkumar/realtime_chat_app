class RoomsController < ApplicationController

  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def create
    @room = Room.create(name: params["name"])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @messages = @single_room.messages
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    render "index"
end

end
