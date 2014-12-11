class HabitsController < ApplicationController

    def index
      @habits = Habit.all
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
