class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return unless block_given?
    recording = yield
    record(recording)
  end

# Another version:
# def listen
#   recording = yield if block_given?
#   record(recording) if recording
# end

# Or simply:
# def listen
#   record(yield) if block_given?
# end

  def play
    puts @recordings.last
  end
end
