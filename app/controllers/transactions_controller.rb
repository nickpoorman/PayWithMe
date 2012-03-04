class TransactionsController < ApplicationController

  # GET /transactions
  # GET /transactions.json
  def index
    @fund = Fund.find(params[:fund_id])
    @transactions = @fund.transactions.all.to_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @fund = Fund.find(params[:fund_id])
    @transaction = @fund.transactions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @fund = Fund.find(params[:fund_id])
    @transaction = @fund.transactions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @fund = Fund.find(params[:fund_id])
    @transaction = @fund.transactions.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @fund = Fund.find(params[:fund_id])
    @user = User.find(params[:user_id])
    @transaction = @transaction.new(params[:transaction])
    @transaction.amount = params[:amount]
    @transaction.user = @user
    @transaction.fund = @fund

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @fund = Fund.find(params[:fund_id])
    @transaction = @fund.transactions.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @fund = Fund.find(params[:fund_id])
    @transaction = @fund.transactions.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :ok }
    end
  end
end
