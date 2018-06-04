class ProvidersController < ApplicationController
  def index
    @summaries = if valid_params.present?
                   Summary.execute_custom_query(@valid_params)
                 else
                   Summary.all
                 end
  end

  private

  def valid_params
    @valid_params ||= params.permit(
      :max_discharges,
      :min_discharges,
      :max_average_covered_charges,
      :min_average_covered_charges,
      :max_average_medicare_payments,
      :min_average_medicare_payments,
      :state
    )
  end
end
