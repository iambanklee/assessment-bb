class CampaignsController < ApplicationController

  def summary
    @campaigns = Campaign.select(:name).group(:name).order(:name).sum(:score)
  end

  def details
    @campaigns = Campaign.where(:name => params[:name]).order(:candidate)
  end
end
