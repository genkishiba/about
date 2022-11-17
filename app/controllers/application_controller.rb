class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private
    def render_not_found
      render file: "#{Rails.root}/public/404.html", status:404, layout: false
    end
end
