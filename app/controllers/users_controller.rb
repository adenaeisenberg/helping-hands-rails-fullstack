class UsersController < ApplicationController
  before_action :authenticate_admin, except: [:new, :create, :update]

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      bio: params[:user][:bio],
      dob: params[:user][:dob],
      phone_number: params[:user][:phone_number],
      admin: params[:user][:admin],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      bio: params[:user][:bio],
      dob: params[:user][:dob],
      phone_number: params[:user][:phone_number],
      # admin: params[:user][:admin]
    )
    redirect_to "/users"
  end

  # def update
  #   @user = User.update(
  #     name: params[:name] || @user.name,
  #     email: params[:email] || @user.email,
  #     password: params[:password] || @user.password, #this might not work
  #     bio: params[:bio] || @user.bio,
  #     dob: params[:dob] || @user.dob,
  #     phone_number: params[:phone_number] || @user.phone_number,
  #     admin: params[:admin] || @user.admin, #only admin
  #   )
  #   render :show
  # end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  # def destroy
  #   @user = User.find_by(id: params[:id])
  #   @user.destroy
  #   render json: { message: "user lost" } #google this!!!
  # end
end
