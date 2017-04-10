class DockerLogger < ActiveSupport::Logger
  attr_accessor :group

  def initialize(*args)
    @stream_output = args[0] == STDOUT || args[0] == STDERR ? true : false
    @group = 'default'

    super(*args)
  end

  def <<(*args)
    args[0] = decorate(*args[0])
    super(*args)
  end

  def add(*args)
    args[2] = decorate(args[2])
    super(*args)
  end

  private

  def decorate(message)
    if @stream_output && ENV.fetch('DOCKER_LOG_DISABLE_DECORATE', '').empty?
      message = message.gsub("\n", '') unless message.nil?
      message = message.to_s + ", group=#{@group}"
    end

    message
  end
end
