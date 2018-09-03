class GaragesController < ApplicationController
  layout 'static'
  layout 'master', only: [:index, :show]

  before_action :set_search_params_to_default

  ## Fixme: Refactor me to perform better
  def index
    modify_search_query

    @services = Service.approved
    @garages = nil

    if !params[:max_radius].present? && !params[:min_radius].present?
      @q = Garage.near(get_lat_long, 999999999999).ransack(params[:q])
    else
      @q = donut_search
    end

    if params[:search_service_ids].present?
      @garages = @q.result.where("services_ids @> ?", "{#{params[:search_service_ids].join(',')}}")
    else
      @garages = @q.result
    end

    if params[:garage_sort_by] == 'rating'
      @garages = @garages.decorate.sort_by(&:avg_rating)
    elsif params[:garage_sort_by] == 'date'
      @garages = @garages.decorate.sort_by(&:created_at)
    else
      params[:garage_sort_by] = 'distance'
      @garages = @garages.decorate
    end

    restore_search_query
  end

  # Garage Profile
  # GET
  def show
    @garage = Garage.find(params[:id]).decorate
    @new_garage = NewGarage.new
  end

  private

  def donut_search
    # Note: Consider the area are looking at as a big donut/ring
    with_in_min_radius = Garage.near(get_lat_long, LocationService.get_min_radius_from_(params))
                             .ransack(params[:q])
                             .result.map(&:id)

    Garage.where.not(id: with_in_min_radius)
        .near(get_lat_long, LocationService.get_max_radius_from_(params))
        .ransack(params[:q])
  end

  # Need to modify search query because _cont_any predicate only takes array of string
  #  https://github.com/activerecord-hackery/ransack/wiki/Basic-Searching#cont_any-contains-any
  def modify_search_query
    query_data = params['q'] && params['q'][Garage::SearchPredicate]
    if query_data.present?
      params['q'][Garage::SearchPredicate] = query_data.split(' ')
    end
  end

  def restore_search_query
    query_data = params['q'] && params['q'][Garage::SearchPredicate]
    if query_data.present?
      params['q'][Garage::SearchPredicate] = query_data.join(' ')
    end
  end

  # @return [Array] [Lat, Long]
  #   Ex:  [40.71, 100.23]
  def get_lat_long
    LocationService.get_lat_long_from_(params, request)
  end

  private

  def set_search_params_to_default
    params[:q] = { Garage::SearchPredicate => '' } if params[:q].nil?
  end

end
