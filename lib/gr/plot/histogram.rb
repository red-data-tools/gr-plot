# frozen_string_literal: true

module GR
  class Plot
    module Histogram
      module_function

      def hist(data, nbins = 0)
        x = data.to_a.map(&:to_f)
        raise ArgumentError, 'histogram data must not be empty' if x.empty?

        nbins = (3.3 * Math.log10(x.length)).round + 1 if nbins <= 1

        xmin, xmax = x.minmax
        if xmin == xmax
          half_width = xmin.zero? ? 0.5 : xmin.abs * 0.5
          xmin -= half_width
          xmax += half_width
        end

        edges = (0..nbins).map { |i| xmin + i.to_f * (xmax - xmin) / nbins }
        counts = Array.new(nbins, 0)
        width = (xmax - xmin).to_f / nbins
        x.each do |value|
          bucket = ((value - xmin) / width).ceil - 1
          bucket = 0 if bucket < 0
          bucket = nbins - 1 if bucket >= nbins
          counts[bucket] += 1
        end
        [edges, counts]
      end
    end
  end
end
