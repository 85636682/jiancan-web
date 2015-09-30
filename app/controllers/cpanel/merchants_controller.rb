class Cpanel::MerchantsController < CpanelController
  def edit
    @merchant = current_merchant
    @merchant.ensure_private_token!
  end

  def update
    @merchant = Merchant.find(current_merchant.id)
    if @merchant.update(merchant_params)
      redirect_to edit_cpanel_merchant_path(@merchant), :notice => "更新成功！"
    else
      render "edit"
    end
  end

  def update_password
    @merchant = Merchant.find(current_merchant.id)
    if @merchant.update_with_password(merchant_params)
      sign_in @merchant, :bypass => true
      redirect_to edit_cpanel_merchant_path(@merchant), :notice => "更新成功！"
    else
      render "edit"
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:password, :password_confirmation, :current_password, :email)
  end
end
