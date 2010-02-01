require 'ruble'

bundle 'RSpec' do |bundle|
  bundle.author = 'David Chelimsky'
  bundle.description = "RSpec RadRails bundle"
  bundle.repository= "git@github.com:aptana/rspec.ruble.git"
  bundle.associate_scope("*spec.rb", "source.ruby.rspec")

  bundle.menu 'RSpec' do |main_menu|
    #main_menu.command 'B40994F6-681A-458A-ACEC-3A5DC8F22ECA'
    main_menu.separator
    #main_menu.command '1AEC727D-CE27-4A36-AD41-F76C843DAC2B'
    #main_menu.command '5D73F8D8-386A-4030-AB46-95F92E42E7B8'
    main_menu.command 'before'
    main_menu.command 'after'
    main_menu.separator
    main_menu.command 'Run Single Example'
    main_menu.command 'Run Examples'
    #main_menu.command '5A91762E-213B-4F29-9F6B-147B7964313B'
    main_menu.command 'Run Examples in selected files/directories'
    main_menu.separator
    main_menu.menu 'Expectations' do |submenu|
      submenu.menu 'General' do |general|
        general.command 'should be'
        general.command 'should_not be'
        general.separator
        general.command 'should equal'
        general.command 'should_not equal'
        general.separator
        general.command 'should satisfy'
        general.command 'should_not satisfy'
        general.separator
        general.command 'should be_close'
        general.command 'should_not be_close'
        general.separator
        general.command 'should match'
        general.command 'should_not match'
        general.separator
        general.command 'should predicate'
      end
      submenu.menu 'Class/Type' do |class_type|
        class_type.command 'should be_instance_of'
        class_type.command 'should_not be_instance_of'
        class_type.separator
        class_type.command 'should be_kind_of'
        class_type.command 'should_not be_kind_of'
        class_type.separator
        class_type.command 'should respond_to'
        class_type.command 'should_not respond_to'
      end
      submenu.menu 'Procs' do |procs|
        procs.command 'should raise_error'
        procs.command 'should_not raise_error'
        procs.separator
        procs.command 'should throw'
        procs.command 'should_not throw'
      end
      submenu.menu 'Collections' do |collections|
        #collections.command '3433F481-8F12-4FD6-9708-9BAAFFEF173A'
        #collections.command 'B08960C5-CA15-4AF6-A12A-2980CD44EA11'
        collections.separator
        collections.command 'should have'
        collections.command 'should have_at_least'
        collections.command 'should have_at_most'
      end
    end
    main_menu.menu 'Mocks' do |mocks|
      mocks.command 'mock'
      mocks.separator
      mocks.menu 'Expectations' do |expectations|
        expectations.command 'should_receive'
        expectations.command 'should_not_receive'
        expectations.command 'with args'
        #expectations.command '35CED179-1676-4EAC-A901-83E25D6315B5'
        #expectations.command '4B60D57E-64A9-4B9C-B04E-FA1568408C9B'
      end
      mocks.menu 'Receive Counts' do |receive|
        receive.command 'once'
        receive.command 'twice'
        receive.command 'exactly'
        receive.separator
        receive.command 'at_least'
        #receive.command '68B6ED77-974B-473E-A536-10482A334C71'
        #receive.command '08F2C0EC-8918-4A6E-8A91-F0DA6FF4FAE7'
        receive.separator
        receive.command 'at_most'
        #receive.command '04F429A9-7845-40DF-954F-5765D5FCF440'
        #receive.command '646FED40-CF07-404F-AD04-79B0EA49AFDF'
        receive.command 'any_number_of_times'
      end
      mocks.menu 'Responses' do |responses|
        responses.command 'and_return with args'
        responses.command 'and_return with block'
        responses.command 'and_raise'
        responses.command 'and_throw'
        responses.command 'and_yield'
      end
    end
    main_menu.separator
    main_menu.menu 'Rails Integration' do |rails|
      #rails.command 'A3628605-ACBC-4983-9DD6-1BD8272CD684'
      rails.command 'Require spec_helper'
      rails.separator
      rails.command 'controller_name'
      rails.command 'describe (Controller)'
      rails.command 'describe (RESTful Controller)'
      rails.separator
      rails.menu 'Expectations' do |rails_expect|
        rails_expect.command 'should have_records'
        rails_expect.separator
        rails_expect.command 'should be_success'
        rails_expect.command 'should_not be_success'
        rails_expect.separator
        rails_expect.command 'should be_redirect'
        rails_expect.command 'should_not be_redirect'
        rails_expect.command 'should redirect_to'
        rails_expect.separator
        rails_expect.command 'should render_template'
      end
    end
    main_menu.command 'configure'
    main_menu.command 'describe (String)'
    main_menu.command 'descripe (type)'
    main_menu.command 'describe (type, string)'
    main_menu.command 'context'
    main_menu.command 'it (does something)'
    main_menu.command 'it (should do something)'
    main_menu.command 'Matcher (DSL)'
    main_menu.command 'Matcher (Custom)'
    main_menu.command 'mock_with'
    main_menu.command 'should =='
    main_menu.command 'should_not =='
    main_menu.command 'should eql'
    main_menu.command 'should_not eql'
    main_menu.command 'should =~'
    main_menu.command 'should_not predicate'
    main_menu.command 'mock_model'
    main_menu.command 'stub'
    main_menu.command 'Save Example file and remember'
    main_menu.command 'Run Last Examples file'
    main_menu.command 'Alternate File'
    main_menu.command 'Update RSpec bundle'
  end
end
