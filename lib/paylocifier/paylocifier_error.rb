class PaylocifierError < StandardError
  attr_reader :status, :messages

  def initialize(status, messages)
    @status = status
    @messages = messages

    super("#{ status }:\n\n#{ messages.join("\n") }")
  end
end
