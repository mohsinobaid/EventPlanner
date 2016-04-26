class EventController < ApplicationController

	layout 'standard'
	def list
	@books = Book.all
	end

	#gives a list of all the books in the database.
	def list
		@events = Event.all
		#The above command tells Rails to search the books table and store each row
		#it finds in the @events instance object
	end

	#shows further details of that event
	def show
		@event = Event.find(params[:id])
		#tells Rails to find only the event that has the id defined in params
	end

	#create a new event
	def new
		@event = Event.new
		@types = Type.all
		#take user input
		#grabs all the types from the database and puts them
		#in an array called @type
	end

	#create a record in the database
	def create
		@event = Event.new(event_params)

		#if the object saves correctly to the databse then user is
		#redirected to the list
		#the save method creates a new row in the database
		if @event.save
			redirect_to :action => 'list'
		else
		#Otherwise the user is sent back to the new method.
			@types = Type.all
			render :action => 'new'
		end
	end

	#used to collect all the fields from object:events
	#the data was passed from the new method to create using the params object
	def event_params
		params.require(:events).permit(:title, :price, :type_id, :description)
	end

	def edit
		@event = Event.find(params[:id])
		@types = Type.all
	end

	#this method will be called after the edit method
	def update
		@event = Event.find(params[:id])

		#update_attributes method overwrites the attributes of the existing row
		if @event.update_attributes(event_param)
			redirect_to :action => 'show', :id => @event
		else
			@types = Type.all
			render :action => 'edit'
		end
	end

	def event_param
		params.require(:event).permit(:title, :price, :type_id, :description)
	end

	def delete
		Event.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

	def show_types
		@type = Type.find(params[:id])
	end

end
