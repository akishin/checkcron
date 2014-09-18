class CronsController < ApplicationController

  # GET
  def index
    @format_str = params[:format_str]
  end

  # POST
  def check
    @format_str = params[:format_str]
    @cron = Cron.new(@format_str)
    if @cron.valid?
      @cron.calculate
      @status = "success"
    else
      @status = "error"
      @message = @cron.errors.get(:format_str)
    end
  rescue => e
    logger.error(get_stack_trace_log(e))
    @status = "error"
    @message = e.message
  end

  private

  def get_stack_trace_log(e)
    return "" unless e
    e.backtrace.inject(msg = "#{e.class} : #{e.message}\n") { |msg, stack| msg += "from:#{stack}\n" }
  end
end
