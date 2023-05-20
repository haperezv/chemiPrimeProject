class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create customer_params

    if @customer.persisted?
      redirect_to customers_new_path(@customer), notice: "New Customer was successfully created."
    else
      format.html  render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:customer)
  end
end
