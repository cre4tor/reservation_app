class ReservationsController < ApplicationController
  before_action :logged_in_client, only: [:new, :create]

  def new
    @time_frames = TimeFrame.order(:start_time, :reservation_date)
    @reservation = Reservation.new
  end

  def create
    @time_frame = TimeFrame.find_by(id: reservation_params)
    @reservation = @time_frame.build_reservation
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
      param = params.require(:reservation).permit(:time_frame_id)
      param.match(/[0-9].*/)
    end
end
