class HabitsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

    def index
      @habits = Habit.order('created_at DESC').page(params[:page]).per(1)
    end

    def new
      @habit = current_user.habits.build
    end

    def starters
      @habit = current_user.habits.build
    end

    def show
      @habit = Habit.find(params[:id])
    end

    def create
      @habit = current_user.habits.build(habit_params)
      if @habit.save!
        redirect_to habits_path
      else
        render :new
      end
    end

    def destroy
      @habit.destroy
      redirect_to habits_path
    end

    private
    def set_pint
      @habit = Habit.find(params[:id])
    end

    def correct_user
      @habit = current_user.habits.find_by(id: params[:id])
      redirect_to habits_path, notice: "Not authorized to edit this pint" if @pint.nil?
    end

    def habit_params
      params.require(:habit).permit(:name, :mission_statement, :description, :frequency, :duration, :text)
    end
end
