module M1
  class Areas < Grape::API
    resource :areas do
      get 'provinces' do
        #@provinces = ChinaCity.list
      end

      params do
        requires :province_id, type: String, desc: "省份id"
      end
      get 'cities' do
        #@cities = ChinaCity.list(params[:province_id])
      end

      params do
        requires :city_id, type: String, desc: "城市id"
      end
      get 'districts' do
        #@districts = ChinaCity.list(params[:city_id])
      end
    end
  end
end
