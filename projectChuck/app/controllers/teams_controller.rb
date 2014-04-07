class TeamsController < ApplicationController
  include ApplicationHelper

  def new
    @team = Team.new
    @teams = Team.unassigned_teams(@team.name)
  end
  
  def edit
    @team = Team.find(params[:id])
    @teams = Team.unassigned_teams(@team.name)
    @bracket = Bracket.find_by_id(@team.bracket_id)
  end
  
  def index
    @teams = Team.alphabetical.paginate(:page => params[:page]).per_page(10)  
  end
  
  def show
  	@team = Team.find(params[:id])
    @eligible_students = @team.eligible_students
  	@bracket = Bracket.find_by_id(@team.bracket_id) unless @team.nil?
  	@registrations = @team.registrations
  	@students = @team.students
  end
  
  def create
    @team = Team.new(params[:team])
    @teams = Team.unassigned_teams(@team.name)
    if @team.save
      # if saved to database
      flash[:notice] = "Successfully created #{team_name(@team.name)}."
      redirect_to @team # go to show team page
    else
      # return to the 'new' form
      render :action => 'new'
    end
  end
  
  def update
    @team = Team.find(params[:id])
    @teams = Team.unassigned_teams(@team.name)
    @bracket = Bracket.find_by_id(@team.bracket_id)
    if @team.update_attributes(params[:team])
      flash[:notice] = "Successfully updated #{team_name(@team.name)}."
      redirect_to @team
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = "Successfully removed #{team_name(@team.name)} from the Project C.H.U.C.K. System"
    redirect_to teams_url
  end

end