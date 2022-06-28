class PenyalurController < ApplicationController
  def new
  end

  def create
    penyalur = Penyalur.find_by(email: params["penyalur"]["email"]).try(:authenticate, params["penyalur"]["password"])
  
    if penyalur
      session[:penyalur_id] = penyalur.id
      render json: {
      status: :created,
      logged_in: true,
      user: penyalur
      }
    else 
      render json: { status: 401 }
    end
  end
end
