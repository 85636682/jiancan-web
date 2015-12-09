class Cpanel::HomeController < CpanelController
  def index
  end

  def prices
  end

  def statistic
    @totals = []
    (0..6).each do |n|
      @totals << Order.by_day(n.days.from_now).where("status = 'settled' OR status = 'completed'").sum(:total_price).to_f()
    end
  end
end
