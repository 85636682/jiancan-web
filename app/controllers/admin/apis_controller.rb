class Admin::ApisController < AdminController
  def index
    @routes = []
    Api::Dispatch.routes.each do |route|
      next if route.route_method.blank?
      next if route.route_version.blank?
      path = route.route_path
      path.sub!('(.:format)', '.json')
      path.sub!('/:version', '')

      r = {
        id: "route-#{route.route_version}-#{path.dasherize.delete('/').delete('.')}",
        method: route.route_method,
        version: route.route_version,
        name: path,
        params: route.route_params,
        desc: route.route_description
      }
      @routes << r
    end
    @routes.sort_by! { |a| a[:method] }.sort_by! { |b| b[:version] }
  end

  def show

  end
end
