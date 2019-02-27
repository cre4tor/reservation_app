# frozen_string_literal: true

# This class has client side reservation function
class ReservationsController < ApplicationController
  before_action :logged_in_client, only: %i[new create]

  def new
    @time_frames = TimeFrame.all.order(:start_time, :reservation_date)
    @reservation = Reservation.new
  end

  def create
    client = current_user.client
    time_frame = TimeFrame.find(time_frame_id_param)
    reservation = time_frame.build_reservation(client: client)

    time_frame.reservation.client_id = client.id

    if reservation.save
      redirect_to @current_user, flash: { success: 'Reservation SUCCESS!' }
    else
      redirect_to new_reservation_path, flash: { danger: 'Reservation failed...' }
    end
  end

  def logged_in_client
    redirect_to login_url, flash: { danger: 'Please log in' } unless logged_in?
    redirect_to @current_user, flash: { danger: 'Permission denied' } unless current_user.client?
  end

  private

  def time_frame_id_param
    params.require(:reservation).permit(:time_frame_id)[:time_frame_id]
  end
end
