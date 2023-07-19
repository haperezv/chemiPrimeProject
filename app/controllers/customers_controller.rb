class CustomersController < ApplicationController
  before_action :set_customer, only: [:destroy, :show]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create customer_params

    if @customer.save
      respond_to do |format|
        format.html { redirect_to customers_path, notice: "New Customer was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "Departament was successfully destroyed."
  end

  private

  def customer_params
    params.require(:customer).permit(:customer)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
