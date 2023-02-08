# frozen_string_literal: true

module CookieDebugger
  # Main Debug class
  class Debug
    class << self
      def call(request)
        cookie_data = map_size(request.cookies)
        session_data = map_size(request.session)

        "CookieDebugger (total size: #{request.headers['Cookie']&.bytesize || 0} bytes) from url: #{request.url}" \
        " | Cookie: #{cookie_data}" \
        " | Session: #{session_data}"
      end

      private

      def map_size(source)
        mapped_sizes = {}
        source.each do |key, val|
          size = val.to_s.bytesize.to_i
          mapped_sizes[size] = [mapped_sizes[size], "[#{key}=#{size}]"].compact.join(', ')
        end

        mapped_sizes.sort.reverse.map(&:last).join(' ')
      end
    end
  end
end
