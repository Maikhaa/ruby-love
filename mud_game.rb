class Game
	def initialize(rooms)
		@rooms = rooms	
		@currentRoom = nil
		start	
	end

	def start
		puts "WELCOME TO THE GAME OF ROOMS\nWhere do you want to go first?"
		getInput
	end

	def printRoomMessage
		puts @currentRoom.message
		getInput
	end

	def getInput
		puts "N,S,E,W?" 
		input = gets
		@direction = input.chomp.downcase
		@theKey = @direction.to_sym
		evaluateInput
	end

	def evaluateInput
		if @currentRoom.nil? 
		  moveFirstRoom		
	  elsif @currentRoom.doors.key?(@theKey)
		  moveNextRoom
		else
		  puts "Sorry, there is no exit here."
		  printRoomMessage
		end
	end

	def moveFirstRoom
		@currentRoom = @rooms[0]
		printRoomMessage
	end

	def moveNextRoom
		@currentRoom = @currentRoom.doors.fetch(@theKey)
		printRoomMessage
	end
end

class Room
	attr_accessor :doors, :message

	def initialize(message)
		@doors = nil
		@message = message
	end

end

room1 = Room.new("You are in a big patio, there are doors everywhere around you.")
room2 = Room.new("This is a dark room, but there is light coming from the east.")
room3 = Room.new("You'd never see a sunrise from this room.")
room4 = Room.new("There are only two doors in this room.")
room5 = Room.new("There is a treasure in this room, gold is all you can see.")

room1.doors = { n: room2, s: room4, e: room3, w: room5 }
room2.doors = { s: room1, e: room3 }
room3.doors = { n: room2, s: room4, w: room1 }
room4.doors = { n: room1, e: room3 }
room5.doors = { e: room1 }

theRooms = [room1,room2,room3,room4,room5]
theGame = Game.new(theRooms)