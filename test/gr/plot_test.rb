# frozen_string_literal: true

require_relative '../test_helper'
require 'gr/plot'

class PlotTest < Test::Unit::TestCase
  def setup
    @plot = GR::Plot.new
  end

  def test_minmax
    assert_equal [Float::INFINITY, -Float::INFINITY], @plot.send(:minmax, :line)
  end

  def test_plot_args_uses_indices_for_single_series
    plot = GR::Plot.new([10, 20, 30])

    assert_equal [[[1.0, 2.0, 3.0], [10, 20, 30], nil, nil, nil]], plot.args
  end

  def test_plot_args_keeps_x_y_series
    plot = GR::Plot.new([1, 2, 3], [10, 20, 30])

    assert_equal [[[1, 2, 3], [10, 20, 30], nil, nil, nil]], plot.args
  end

  def test_plot_args_applies_callable_y_values
    plot = GR::Plot.new([1, 2, 3], ->(x) { x * x })

    assert_equal [[[1, 2, 3], [1, 4, 9], nil, nil, nil]], plot.args
  end

  def test_plot_args_does_not_mutate_series_arguments
    series = [[1, 2, 3], [10, 20, 30], { spec: 'r' }]

    GR::Plot.new(series)

    assert_equal [[1, 2, 3], [10, 20, 30], { spec: 'r' }], series
  end

  def test_version_is_loaded_by_plot_require
    assert_match(/\A\d+\.\d+\.\d+\z/, GR::Plot::VERSION)
  end
end
