# Users Controller
class UsersController < ApplicationController
  def index
    render json: User.all.limit(50).to_json(root: false)
  end

  def show
    u = current_user
    render json: {
      _id: {
        '$oid' => u.id
      },
      userID: u.userID,
      artists: u.artists,
      user_tags: u.tags
    }
  end

  def artist
    a = {}
    current_user.artists.where(artistID: params[:artist_id].to_i).each_with_rel.select do |n, r|
      a = {
        _id: {
          '$oid' => n.id
        },
        artistID: n.artistID,
        weight: r.weight
      }
    end
    render json: a
  end

  def show_user_id
    u = User.find_by(userID: params[:id].to_i)
    render json: {
      _id: {
        '$oid' => u.id
      },
      userID: u.userID,
      artists: u.artists,
      user_tags: u.tags
    }
  end

  # def top_5_by_sum
  #   render json: current_user.user_recommendations.desc(:sum_artist_weight).take(5)
  # end

  # def top_5_by_number
  #   render json: current_user.user_recommendations.desc(:total_listeners_count).take(5)
  # end

  # def top_5_by_tags
  #   render json: AllArtist.where('artist_tags.tagID' => params[:tag_id].to_i).not_in(artistID: current_user.artists.map(&:artistID).to_a).desc(:total_listeners_count).take(5)
  # end

  private

  def current_user
    User.find(params[:id])
  end

  def user_params
    params[:user].permit(:userID)
  end
end
