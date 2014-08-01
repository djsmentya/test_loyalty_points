class PointExpirer
  def expire(date)
    expired_points = PointLineItem.where("created_at < ? or source like '%expired' ", date - 1.year).
                                              group(:user_id).sum(:points)

    create_expiration_records(expired_points)
  end

  private
    def create_expiration_records(expired_points)
      expirations = []
      expired_points.each do | user_id, points |
        if points > 0
          expirations << [
            user_id: user_id,
            points: points * -1,
            source: source_description(points)
          ]
        end
      end
      PointLineItem.create expirations
    end

    def source_description(points)
      "Points ##{ (points/250*5).to_i} expired"
    end
end

