class ReservationsController < ApplicationController
  before_action :logged_in_client, only: [:new, :create]

  def new
    @time_frames = TimeFrame.all.order(:start_time, :reservation_date)
    @reservation = Reservation.new
  end

  def create
    @client = Client.find_by(user_id: @current_user)
    @time_frame = TimeFrame.find_by(id: reservation_params)
    @reservation = @time_frame.build_reservation(client_id: @client)

    binding.pry
    @time_frame.reservation.client_id = @client.id

    binding.pry
    if @reservation.save
      flash[:success] = "Reservation SUCCESS!"
      redirect_to current_user
    else
      flash[:danger] = "Reservation failed..."
      redirect_to new_reservation_path
    end
  end

  def logged_in_client
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
    unless current_user.client?
      flash[:danger] = "Permission denied"
      redirect_to @current_user
    end
  end

  private

    def reservation_params
      param = params.require(:reservation).permit(:time_frame_id).to_s
      param.delete("^0-9").to_i
    end
end
