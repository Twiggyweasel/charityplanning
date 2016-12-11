class OrganizationsController < ApplicationController
  
  def index 
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end
  
  def new
    @organization = Organization.new
  end
  
  def create 
    @organization = Organization.new(organization_params)
    
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private 
  
    def organization_params
      params.required(:organization).permit(:name, :desc, :org_cover)
    end
  
end
