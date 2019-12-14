class Admin::AdminController < ApplicationController
  layout "admin/layouts/application"

  def index
    render "admin/layouts/application"
  end
end
