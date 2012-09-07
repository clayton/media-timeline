class CapturesByDateBuilder
  def initialize(params)
    @params = params
    @captures = Capture.includes(:site).order("sites.name")
  end

  def build_captures
    set_from_dates
    set_to_dates
    filter_by_from_dates
    filter_by_to_dates
    group_captures
    @captures
  end

  def set_from_dates
    @from_year  = @params[:from_year] || @params[:year] || Time.now.year
    @from_month = @params[:from_month] || @params[:month] || Time.now.month
    @from_day   = @params[:from_day] || @params[:day] || Time.now.day
    @from_hour  = @params[:from_hour] || @params[:hour] || Time.now.hour
  end

  def set_to_dates
    @to_year  = @params[:to_year] || nil
    @to_month = @params[:to_month] || nil
    @to_day   = @params[:to_day] || nil
    @to_hour  = @params[:to_hour] || nil
  end

  def filter_by_from_dates
    @operand = @params[:through] == "true" ? "<=" : "="
    @captures = @captures.where(["year_captured #{@operand} ?", @from_year])
                         .where(["month_captured #{@operand} ?", @from_month])
                         .where(["day_captured #{@operand} ?", @from_day])
                         .where(["hour_captured #{@operand} ?", @from_hour])
  end

  def filter_by_to_dates
    return unless @to_year
    @captures = @captures.where(["year_captured >= ?", @to_year])
                         .where(["month_captured >= ?", @to_month])
                         .where(["day_captured >= ?", @to_day])
                         .where(["hour_captured >= ?", @to_hour])
  end

  def group_captures
    @captures = @captures.group_by{ |capture| capture.created_at.strftime("%A %B %e, %Y at %l%p %Z") }
  end
end