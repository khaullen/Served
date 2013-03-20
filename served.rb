#! /usr/bin/env ruby

require 'socket'

class Served
	def initialize
		@server = TCPServer.new('localhost', 7890)
	end
	
	def start
		loop do
			client = @server.accept
			if (request = client.gets)
				request = request.split
				case request[0]
				when "GET" then get(client, request)
				end
			end
			client.close
		end
	end
	
	def get(client, request)
		#client.print "HTTP/1.1 200/OK\r\nContent-type:text/html\r\n\r\n"
		client.print "HTTP/1.1 404 Not Found"
	end
end

Served.new.start