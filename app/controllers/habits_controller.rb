class HabitsController < ApplicationController
  before_action :authenticate_user!

    def index
      @habits = Habit.order('created_at DESC').page(params[:page]).per(1)
    end

    def new
      @habit = Habit.new
    end

    def show
      @habit = Habit.find(params[:id])
    end

    def create
      @habit = Habit.new(params.require(:habit).permit(:name, :mission_statement, :description, :frequency, :duration, :text))
      if @habit.save!
        redirect_to habits_path
      else
        render :new
      end
    end

    def destroy
      @habit = Habit.find(params[:id])
      @habit.destroy
      redirect_to habits_path
    end

end
