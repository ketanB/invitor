class GuestsController < ApplicationController

  def guest_bringing_people
    guest = Guest.find(params[:id])
    guest.no_of_people_to_bring = params[:no_of_guests]

    guest.save
    render :text=>"Guests information updated." and return
  end

end
