# -*- coding: utf-8 -*-
require 'parse-cron'

class Cron
  include ActiveModel::Model
  attr_accessor :format_str, :last, :next, :date

  validates :format_str, :presence => true

  cattr_accessor :logger
  self.logger ||= Rails.logger

  MAX_CALCULATE   = 5

  def initialize(format_str, max = MAX_CALCULATE)
    @format_str = format_str
    @parser = CronParser.new(@format_str)
    @next = []
    @max = max
  end

  def calculate
    @date = Time.now
    @last = @parser.last(@date)
    d = @date.dup
    @max.times {
      d = @parser.next(d)
      @next << d
    }
  end

end
