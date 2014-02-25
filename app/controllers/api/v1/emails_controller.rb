class Api::V1::EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /api/v1/emails
  def create
    respond_to do |format|
      format.json do
        if params[:email].present? && /.+@.+/ =~ params[:email].to_s && Email.create(:email => params[:email].to_s)
          #render :text => "t"
          render :json => {"status" => 1}.to_json
        else
          render :json => {"status" => 0}.to_json
        end
      end
    end
  end


end
