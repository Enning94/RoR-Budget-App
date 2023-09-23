class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @expenses = @user.expenses
    # render :new
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @user = current_user
    @expense = @user.expenses.new
    @groups = current_user.groups
    @group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @user = current_user
    @expense = @user.expenses.new(expense_params)

    if params[:expense][:group_id].present?
      group = Group.find(params[:expense][:group_id])
      @expense.groups << group
    elsif params[:expense][:group_ids].present?
      group_ids = params[:expense][:group_ids]
      @expense.group_ids = group_ids
    end

    respond_to do |format|
      if @expense.save
        format.html do
          redirect_to user_group_path(user_id: @user.id, id: @expense.group_ids),
                      notice: 'Expense was successfully created.'
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end
end
