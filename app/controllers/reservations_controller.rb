class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @time_frame = TimeFrame.findby(id: current_user)
    @reservation = @time_frame.build_reservation(reservation_params)
    binding.pry
    if @reservation.save
      flash[:success] = "Reservation SUCCESS!"
      redirect_to current_user
    else
      flash[:danger] = "Reservation failed..."
      redirect_to new_reservation_path
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:title)
    end
end
