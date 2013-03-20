#! /usr/bin/env ruby

require 'socket'

class Served
	def initialize
		@server = TCPServer.new('localhost', 7890)
	end
	
	def start
		loop do
			client = @server.accept
			client.print "HTTP/1.1 200/OK\r\nContent-type:text/html\r\n\r\n"
			request = client.gets
			puts request
			client.close
		end
	end
end

Served.new.start