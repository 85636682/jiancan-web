class Cpanel::HomeController < CpanelController
  def index
  end

  def prices
  end

  def statistic
    @totals = []
    (0..6).each do |n|
      @totals << current_merchant.shop.orders.by_day(Date.today - n.days).where("status = 'settled' OR status = 'completed'").sum(:total_price).to_f()
    end
    @totals = @totals.reverse
  end
end
