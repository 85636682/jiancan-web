class Cpanel::HomeController < CpanelController
  def index
  end

  def prices
  end

  def statistic
    @totals = []
    (0..6).each do |n|
      @totals << Order.where(:created_at => Date.current - n).sum(:total_price).to_f()
    end
  end
end
