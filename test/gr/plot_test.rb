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

  def test_version_is_loaded_by_plot_require
    assert_match(/\A\d+\.\d+\.\d+\z/, GR::Plot::VERSION)
  end
end
