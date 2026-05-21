# frozen_string_literal: true

require_relative '../../test_helper'
require 'gr/plot'

class PlotHistogramTest < Test::Unit::TestCase
  def test_hist_matches_julia_binning
    edges, counts = GR.send(:hist, [1, 2, 2, 3, 3, 3], 3)

    assert_equal [1.0, 1.6666666666666665, 2.333333333333333, 3.0], edges
    assert_equal [1, 2, 3], counts
  end

  def test_hist_rejects_empty_data
    assert_raise(ArgumentError) do
      GR.send(:hist, [], 3)
    end
  end
end
