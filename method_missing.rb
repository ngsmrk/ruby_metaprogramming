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
    "Inner call"
  end
  
  def do_something_with_params args
    "Do something with params #{args}"
  end  
  
  def do_something_with_params *args
    "Do something with splatted params #{args}"
  end
  
  def do_something_with_block &block
    puts "Do something with block #{block}"
    yield
  end  
end

class MethodMissingTest < Test::Unit::TestCase

    def proxy
      LoggingProxy.new(STDOUT, Delegate.new)
    end

    def test_method_missing_no_params
      assert_equal "Inner call", proxy.do_something, "Wrong call"
    end
    
    def test_method_missing_with_params
      assert_equal "Do something with splatted params [1]", proxy.do_something_with_params(1), "Wrong call again"
    end    
end