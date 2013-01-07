class LoggingProxy
  
  attr_writer :logger
  
  attr_writer :delegate
  
  def initialize(logger, delegate)
    @logger = logger
    @delegate = delegate
  end
  
  def method_missing(method_name, *args, &block)
    logger.puts "Delegating: #{method_name}"
    @delegate.send(method_name, *args, &block)
  end
  
  def respond_to?(method_name)
    logger.puts "Responding to: #{method_name}"
    @delegate.respond_to? method_name
  end
  
  def logger
    @logger ||= STDOUT
  end
end

class Delegate
  def do_something
    puts "Inner call"
  end
  
  def do_something_with_params args
    puts "Do something with params #{args}"
  end  
  
  def do_something_with_params *args
    puts "Do something with splatted params #{args}"
  end
  
  def do_something_with_block &block
    puts "Do something with block #{block}"
    yield
  end  
end

lp = LoggingProxy.new(STDOUT, Delegate.new)
lp.do_something

lp.do_something_with_params 1

lp.do_something_with_params(1, 2)

lp.do_something_with_params({ :one => "uno", :two => "dos" })

da_block = lambda { puts "testing da block"}
lp.do_something_with_block(&da_block)

stabby_lambda_block = -> { puts "testing stabby lambda" }
lp.do_something_with_block(&stabby_lambda_block)