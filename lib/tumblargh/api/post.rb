module Tumblargh
  module API

    class Post < Base
      def photo_url(size=500)
        return nil if (photos.nil? || photos.empty?)

        size = size.to_i

        orig = photos.first[:original_size]
        res = photos.first[:alt_sizes].select do |p|
          p[:width] == size
        end

        res.empty? ? orig[:url] : res.first[:url]
      end

      def video(size=500)
        return nil if (player.nil? || player.empty?)

        size = size.to_i

        res = player.select do |p|
          p[:width] == size
        end

        res.empty? ? nil : res.first[:embed_code]
      end

    end

  end
end