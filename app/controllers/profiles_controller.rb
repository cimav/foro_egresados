class ProfilesController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @users = User.all

    @student = begin
                 curp = @user.curp.blank? ? :'CURP_EN_BLANCO' : @user.curp
                 Student.includes(:these, :area).where(curp: curp).last
               rescue StandardError, AnotherError => e
                 puts e
                 nil
               end

  end

  def update_curp

    user = User.find(params['user'][:id])
    if user
      user.curp = params['user']['curp']
      user.save!
    end

    redirect_to "/users/#{params['user'][:id]}"

  end

  def update_trajectory

    user = User.find(params['user'][:id])
    if user
      user.linkedin = params['user']['linkedin']
      user.sni = params['user']['sni']
      user.address = params['user']['address']
      user.telephone = params['user']['telephone']
      user.academic_institution = params['user']['academic_institution']
      user.academic_program = params['user']['academic_program']
      user.academic_description = params['user']['academic_description']
      user.work_type = params['user']['work_type']
      user.work_place = params['user']['work_place']
      user.work_position = params['user']['work_position']
      user.work_description = params['user']['work_description']

      user.save!
    end

    redirect_to "/users/#{params['user'][:id]}"

  end

end
