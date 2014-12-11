class JournalsController < ApplicationController
  def create
    @habit = Habit.find(params[:habit_id])
    @journal = @habit.journals.create(journal_params)
    redirect_to root_path
  end

  def destroy
    @habit = Habit.find(params[:habit_id])
    @journal = @habit.journals.create(journal_params)
    redirect_to habit_path(@habit)
  end

  private
  def journal_params
    params.require(:journal).permit(:body)
  end
end
