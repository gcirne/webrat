require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe Webrat::Selenium::ApplicationServers::Base do
  before :each do
    @base = Webrat::Selenium::ApplicationServers::Base.new
  end

  it 'should boot with default configuration' do
    @base.should_receive(:start).with(no_args()).once
    @base.should_receive(:wait).with(no_args()).once
    @base.should_receive(:stop_at_exit).with(no_args()).once

    @base.boot
  end

  it 'should boot when configured to do so' do
    Webrat.configure do |config|
      config.boot_application = true
    end

    @base.should_receive(:start).with(no_args()).once
    @base.should_receive(:wait).with(no_args()).once
    @base.should_receive(:stop_at_exit).with(no_args()).once

    @base.boot
  end

  it 'should not boot when not configured to do so' do
    Webrat.configure do |config|
      config.boot_application = false
    end

    @base.should_not_receive(:start)
    @base.should_not_receive(:wait)
    @base.should_not_receive(:stop_at_exit)

    @base.boot
  end
end
