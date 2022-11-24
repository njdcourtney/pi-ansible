#!/usr/bin/ruby

require 'cgi'
require 'erb'

class Day
    attr_reader :events, :timelapse
    def initialize(timestamp)
        @timestamp=timestamp
        @events={}
        @timelapse=[]
    end

    def newEvent(id)
        @events[id] ||= {:video=>[],:img=>[]}
    end

    def addTimelapse(file)
        @timelapse.push(file)
    end

    def addVideo(id,file)
        newEvent(id)
        @events[id][:video].push(file)
    end

    def addImg(id,file)
        newEvent(id)
        @events[id][:img].push(file)
    end

end

@days={}
@unknown=[]
@files=0

Dir.each_child("/mnt/CamData/motion/files") do |filename|
    @files+=1
    case filename
    when /([0-9]{8})-([0-9]{6})-timelapse.mpg/
        @days[$1] ||= Day.new($1)
        @days[$1].addTimelapse(filename)
    when /([0-9]{8})-([0-9]+)-([0-9]{6}).mkv/
        @days[$1] ||= Day.new($1)
        @days[$1].addVideo($2,filename)
    when /([0-9]{8})-([0-9]+)-([0-9]{6}-[0-9]+).jpg/
        @days[$1] ||= Day.new($1)
        @days[$1].addImg($2,filename)
    else 
        @unknown.push(filename)
    end
end

puts ERB.new(File.read('index.html.erb')).result
