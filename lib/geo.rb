module Geo
  class DistanceCalculator
    RAD_PER_DEG = Math::PI / 180
    RM = 6371000

    # Alternatively we can use GeoCoder
    def self.get_distance(lat1, lon1, lat2, lon2)
      lat1_rad, lat2_rad = lat1 * RAD_PER_DEG, lat2 * RAD_PER_DEG
      lon1_rad, lon2_rad = lon1 * RAD_PER_DEG, lon2 * RAD_PER_DEG

      haversine = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
      distance  = RM * 2 * Math::atan2(Math::sqrt(haversine), Math::sqrt(1 - haversine))

      distance
    end
  end
end
