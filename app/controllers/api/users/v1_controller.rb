class Api::Users::V1Controller < ApplicationController
  def search
    data = search_params[:query].present? ?
               User.by_query(search_params[:query]) : User.all.to_json

    render json: { data: data }, status: :ok
  end

  private

  def search_params
    params.permit(:query)
  end
end
