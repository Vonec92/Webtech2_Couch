class RemindersController < ApplicationController
	include ActionController::ImplicitRender

	def index
		@finished = Reminder.where(finished: true)
		@unfinished = Reminder.where(finished: false)
	end

	def show
		@reminder = Reminder.find(params[:id])
	end

	def new
		@reminder = Reminder.new
	end

	def edit
		@reminder = Reminder.find(params[:id])
	end

	def create
		if @reminder = Reminder.create(cr_params)
			redirect_to(:action => "show", :id => @reminder.id)
		else
			render "new"
		end
	end

	def update
		@reminder = Reminder.find(params[:id])
		if @reminder.update_attributes(upd_params)
			redirect_to(:action => "show", :id => @reminder.id)
		else
			render "edit"
		end
	end

	def make_finish
		@reminder = Reminder.find(params[:id])
		@reminder.finished = toggle(@reminder.finished)
		if @reminder.save
			redirect_to(:action => "index")
		else
			render "index"
		end
	end

	def destroy
		@reminder = Reminder.find(params[:id])
		if @reminder.destroy
			redirect_to(:action => "index")
		else
			render "index"
		end
	end

	private
	def cr_params
		params.require(:reminder).permit(:title, :description, :due_date, :priority, :finished)
	end

	def upd_params
		params.require(:reminder).permit(:description, :due_date, :priority, :finished)
	end

	def toggle(number)
		if number == 0
			return 1
		elsif number == 1
			return 0
		else
			return 0
		end
	end
end
