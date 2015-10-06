# Tags Controller
class TagsController < ApplicationController
  def index
    render json: AllTag.all.to_json(root: false)
  end
end
