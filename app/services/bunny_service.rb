class BunnyService

  attr_reader :send_read

  def initialize
    connection = Bunny.new(
      :host => "experiments.turing.io",
      :port => "5672",
      :user => "student",
      :pass => "PLDa{g7t4Fy@47H"
    )
    connection.start
    channel = connection.create_channel
    @send_read = channel.queue("read.link")
  end

  def send_link(link)
    @send_read.publish(link)
  end


end
