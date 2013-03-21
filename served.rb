#! /usr/bin/env ruby

require 'socket'

class Served
	def initialize
	end
	
	def start
		Socket.tcp_server_loop(7890) do |connection|
			if (request = connection.gets)
				request = request.split
				case request[0]
				when "GET" then get(client, request)
				end
			end
			connection.close
		end
	end
	
	def get(client, request)
		client.print "HTTP/1.1 200 OK\r\nContent-type:text/html\r\n\r\n"
		client.print "herro kenzie!"
		#client.print "HTTP/1.1 404 Not Found\r\n\r\n"
		puts request.join(' ')
	end
end

Served.new.start

# - bug: server accepts only first line of client request, then returns