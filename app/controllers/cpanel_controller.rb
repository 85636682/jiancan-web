class CpanelController < ApplicationController
  layout "cpanel"
  before_action :require_merchant
end