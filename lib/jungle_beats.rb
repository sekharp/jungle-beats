require 'pry'
require_relative 'nodes'
require_relative 'list'

class JungleBeat
  attr_accessor :beats, :list

  def initialize(beats_file, beats_text)
    @file_name = beats_file
    @beats = File.read(beats_file)
    @list  = List.new(@head_of_list)
    beats_linked_list = @beats.split(" ").each do |beat|
      @list.append(beat)
    end
    @head_of_list = @list.head
  end

  def list
    beats_text.split(" ").each do |beat|
      @list.append(beat)
    end
  end

  def append(beats_text)
    beats_text.split(" ").each do |beat|
      @list.append(beat)
    end
    beats_text.split(" ").count
  end

  def all
    @list.all
  end

  def prepend(beats_text)
    beats_text.split(" ").each do |beat|
      @list.append(beat)
    end
    beats_text.split(" ").count
  end

  def pop(number)
    @list.pop(number)
  end

  def insert(position, beat)
    @list.insert(position, beat)
  end

  def includes?(beats_text)
    beats_text.split(" ").each do |beat|
      @list.includes?(beat)
    end
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Boing "#{@beats}"`
    beats_array = @beats.split(" ")
    sound_count = beats_array.count
    puts "Played #{sound_count} sounds from `#{@file_name}`"
  end

end

beats_file = ARGV[0]
beats_text = ARGV[1]
JungleBeat.new(beats_file, beats_text).play
binding.pry
