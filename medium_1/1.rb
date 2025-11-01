class Device
  def initialize
    @recordings = []
  end
  
  def record(recording)
    @recordings << recording
  end
  
  def listen(&recording)
    record(recording.call) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Output: Hello World!
