class DockerLogger < ActiveSupport::Logger
  def fatal(msg)
    msg = 'testtesttest ' + msg
    msg = msg.gsub("\n", '')
    super(msg)
  end
end
