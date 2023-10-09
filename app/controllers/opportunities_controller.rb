class OpportunitiesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:new, :create, :index, :show]

  def new
    @opportunity = Opportunity.new
    render :new
  end

  def create
    @opportunity = Opportunity.create(
      title: params[:opportunity][:title],
      description: params[:opportunity][:description],
      date: params[:opportunity][:date],
      user_id: current_user.id,
      status: false,
    )
    redirect_to "/opportunities"
  end

  def index
    @opportunities = Opportunity.all
    render :index
  end

  def show
    @opportunity = Opportunity.find_by(id: params[:id])
    render :show
  end

  def edit
    @opportunity = Opportunity.find_by(id: params[:id])
    render :edit
  end

  # def update
  #   @opportunity = Opportunity.find_by(id: params[:id])
  #   @opportunity.update(
  #     title: params[:title] || @opportunity.title,
  #     description: params[:description] || @opportunity.description,
  #     date: params[:date] || @opportunity.date,
  #     # user_id: params[:user_id] || @opportunity.user_id,
  #     status: params[:status] || @opportunity.status,
  #   )
  #   render :show
  # end

  def update
    @opportunity = Opportunity.find_by(id: params[:id])
    @opportunity.update(
      title: params[:opportunity][:title],
      description: params[:opportunity][:description],
      date: params[:opportunity][:date],
    )
    redirect_to "/opportunities"
  end

  def destroy
    @opportunity = Opportunity.find_by(id: params[:id])
    @opportunity.destroy
    render json: { message: "Opportunity lost" } #google this!!!
  end
end
