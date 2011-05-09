# encoding: UTF-8

class GradesController < ApplicationController
  def create
    @grade = current_user.grades.new(params[:grade])
    if @grade.save
      flash[:notice] = "Tu voto ha sido guardado con éxito."
    else
      flash[:error] = "Tu voto no pudo ser guardado."
    end
    redirect_to @grade.trade
  end
end
