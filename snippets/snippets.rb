require 'ruble'

with_defaults :scope => 'source.ruby.rspec' do |bundle|
snippet 'and_raise' do |s|
  s.trigger = 'anr'
  s.expansion = 'and_raise(${1:exception})'
end

snippet 'and_return with block' do |s|
  s.trigger = 'anrb'
  s.expansion = 'and_return { $1 }'
end

snippet 'and_return with args' do |s|
  s.trigger = 'andra'
  s.expansion = 'and_return(${1:value})'
end

snippet 'and_throw' do |s|
  s.trigger = 'ant'
  s.expansion = 'and_throw(${1:sym})'
end

snippet 'and_yield' do |s|
  s.trigger = 'any'
  s.expansion = 'and_yield(${1:values})'
end

snippet 'any_number_of_times' do |s|
  s.trigger = 'annot'
  s.expansion = 'any_number_of_times'
end

snippet 'at_least' do |s|
  s.trigger = 'atl'
  s.expansion = 'at_least(${1:n}).times'
end

snippet 'at_most' do |s|
  s.trigger = 'atm'
  s.expansion = 'at_most(${1:n}).times'
end

snippet 'configure' do |s|
  s.trigger = 'cnf'
  s.expansion = 'Spec::Runner.configure do |config|
  config.$0
end'
end

snippet 'context' do |s|
  s.trigger = 'con'
  s.expansion = 'context "${1:context}" do
  $0
end'
end

snippet 'describe (Controller)' do |s|
  s.trigger = 'desc'
  s.expansion = 'require File.expand_path(File.dirname(__FILE__) + \'/../spec_helper\')

describe ${1:controller} do
  $0
end'
end

snippet 'describe (RESTful Controller)' do |s|
  s.trigger = 'desrc'
  s.expansion = 'describe ${1:controller}, "${2:GET|POST|PUT|DELETE} ${3:/some/path}${4: with some parameters}" do
  $0
end'
end

snippet 'describe (String)' do |s|
  s.trigger = 'des'
  s.expansion = 'describe "${1:subject}" do
  $0
end'
end

snippet 'describe (type)' do |s|
  s.trigger = 'dest'
  s.expansion = 'describe ${1:Type} do
  $0
end'
end

snippet 'describe (type, string)' do |s|
  s.trigger = 'dests'
  s.expansion = 'describe ${1:Type}, "${2:description}" do
  $0
end'
end

snippet 'exactly' do |s|
  s.trigger = 'ex'
  s.expansion = 'exactly(${1:n}).times'
end

snippet 'it (should do something)' do |s|
  s.trigger = 'its'
  s.expansion = 'it "should ${1:do something}"${2: do
  $0
end}'
end

snippet 'it (does something)' do |s|
  s.trigger = 'it'
  s.expansion = 'it "${1:does something}"${2: do
  $0
end}'
end

snippet 'Matcher (Custom)' do |s|
  s.trigger = 'matc'
  s.expansion = 'class ${1:ReverseTo}
  def initialize($3)
    @$3 = $3
  end

  def matches?(actual)
    @actual = actual
    # Satisfy expectation here. Return false or raise an error if it\'s not met.
    ${0:@actual.reverse.should == @$3}
    true
  end

  def failure_message_for_should
    "expected #{@actual.inspect} to $2 #{@$3.inspect}, but it didn\'t"
  end

  def failure_message_for_should_not
    "expected #{@actual.inspect} not to $2 #{@$3.inspect}, but it did"
  end
end

def ${2:reverse_to}(${3:expected})
  $1.new($3)
end'
end

snippet 'Matcher (DSL)' do |s|
  s.trigger = 'mat'
  s.expansion = 'Spec::Matchers.define :${1:name} do |${2:expected}|
  match do |${3:actual}|
    $3.$1?($2)
  end
end
'
end

snippet 'mock' do |s|
  s.trigger = 'moc'
  s.expansion = '${1:var} = mock("${2:mock_name}"${3:, :null_object => true})
$0'
end

snippet 'mock_model' do |s|
  s.trigger = 'mm'
  s.expansion = 'mock_model(${1:model})$0'
end

snippet 'mock_with' do |s|
  s.trigger = 'mocw'
  s.expansion = 'Spec::Runner.configure do |config|
	config.mock_with :${0:mocha|flexmock|rr}
end'
end

snippet 'once' do |s|
  s.trigger = 'on'
  s.expansion = 'once'
end

snippet 'Require spec_helper' do |s|
  s.trigger = 'reqs'
  s.expansion = 'require \'spec_helper\'

'
end

snippet 'should be_success' do |s|
  s.trigger = 'shbs'
  s.expansion = 'response.should be_success
$0'
end

snippet 'should_not be_success' do |s|
  s.trigger = 'shnbs'
  s.expansion = 'response.should_not be_success
$0'
end

snippet 'controller_name' do |s|
  s.trigger = 'conn'
  s.expansion = 'controller_name :${1:controller}'
end

snippet 'before' do |s|
  s.trigger = 'bef'
  s.expansion = 'before(${1::each}) do
  $0
end'
end

snippet 'should ==' do |s|
  s.trigger = 'sh='
  s.expansion = '${1:target}.should == ${2:value}
$0'
end

snippet 'should =~' do |s|
  s.trigger = 'shm'
  s.expansion = '${1:target}.should =~ /${2:regexp}/
$0'
end

snippet 'should eql' do |s|
  s.trigger = 'she'
  s.expansion = '${1:target}.should eql(${2:value})
$0'
end

snippet 'should be' do |s|
  s.trigger = 'shb'
  s.expansion = '${1:target}.should be(${2:result})
$0'
end

snippet 'should be_kind_of' do |s|
  s.trigger = 'shbko'
  s.expansion = '${1:target}.should be_a_kind_of(${2:klass})
$0'
end

snippet 'should be_instance_of' do |s|
  s.trigger = 'shbio'
  s.expansion = '${1:target}.should be_instance_of(${2:klass})
$0'
end

snippet 'should be_close' do |s|
  s.trigger = 'shbc'
  s.expansion = '${1:target}.should be_close(${2:result}, ${3:tolerance})
$0'
end

snippet 'should be_redirect' do |s|
  s.trigger = 'shbr'
  s.expansion = 'response.should be_redirect
$0'
end

snippet 'should equal' do |s|
  s.trigger = 'she'
  s.expansion = '${1:target}.should equal(${2:value})
$0'
end

snippet 'should have' do |s|
  s.trigger = 'shh'
  s.expansion = '${1:target}.should have(${2:num}).${3:things}
$0'
end

snippet 'should have_at_least' do |s|
  s.trigger = 'shhal'
  s.expansion = '${1:target}.should have_at_least(${2:num}).${3:things}
$0'
end

snippet 'should have_at_most' do |s|
  s.trigger = 'shham'
  s.expansion = '${1:target}.should have_at_most(${2:num}).${3:things}
$0'
end

snippet 'should have_records' do |s|
  s.trigger = 'shhr'
  s.expansion = '${1:target}.should have(${2:x}).records
$0'
end

snippet 'should match' do |s|
  s.trigger = 'shm'
  s.expansion = '${1:target}.should match(/${2:regexp}/)
$0'
end

snippet 'should_not ==' do |s|
  s.trigger = 'shn='
  s.expansion = '${1:target}.should_not == ${2:value}
$0'
end

snippet 'should_not =~' do |s|
  s.trigger = 'shnm'
  s.expansion = '${1:target}.should_not =~ /${2:regexp}/
$0'
end

snippet 'should_not eql' do |s|
  s.trigger = 'shne'
  s.expansion = '${1:target}.should_not eql(${2:value})
$0'
end

snippet 'should_not be' do |s|
  s.trigger = 'shnb'
  s.expansion = '${1:target}.should_not be(${2:result})
$0'
end

snippet 'should_not be_kind_of' do |s|
  s.trigger = 'shkof'
  s.expansion = '${1:target}.should_not be_a_kind_of(${2:klass})
$0'
end

snippet 'should_not be_instance_of' do |s|
  s.trigger = 'shbio'
  s.expansion = '${1:target}.should_not be_instance_of(${2:klass})
$0'
end

snippet 'should_not be_close' do |s|
  s.trigger = 'shnbc'
  s.expansion = '${1:target}.should_not be_close(${2:result}, ${3:tolerance})
$0'
end

snippet 'should_not be_redirect' do |s|
  s.trigger = 'shnbr'
  s.expansion = 'response.should_not be_redirect
$0'
end

snippet 'should_not equal' do |s|
  s.trigger = 'shne'
  s.expansion = '${1:target}.should_not equal(${2:value})
$0'
end

snippet 'should_not match' do |s|
  s.trigger = 'shnm'
  s.expansion = '${1:target}.should_not match(/${2:regexp}/)
$0'
end

snippet 'should_not predicate' do |s|
  s.trigger = 'shnp'
  s.expansion = '${1:target}.should_not ${2:be_${3:predicate}} $4
$0'
end

snippet 'should_not raise_error' do |s|
  s.trigger = 'shnre'
  s.expansion = 'lambda { $1 }.should_not raise_error(${2:error})
$0'
end

snippet 'should_not_receive' do |s|
  s.trigger = 'shnr'
  s.expansion = '${1:mock}.should_not_receive(:${2:message})$3
$0
'
end

snippet 'should_not respond_to' do |s|
  s.trigger = 'shnrt'
  s.expansion = '${1:target}.should_not respond_to(:${2:sym})
$0'
end

snippet 'should_not satisfy' do |s|
  s.trigger = 'shns'
  s.expansion = '${1:target}.should_not satisfy { |obj| $2 }
$0'
end

snippet 'should_not throw' do |s|
  s.trigger = 'shnt'
  s.expansion = 'lambda { $1 }.should_not throw_symbol(:${2:symbol})
$0'
end

snippet 'should predicate' do |s|
  s.trigger = 'shp'
  s.expansion = '${1:target}.should ${2:be_${3:predicate}} $4
$0'
end

snippet 'should raise_error' do |s|
  s.trigger = 'shre'
  s.expansion = 'lambda { $1 }.should raise_error(${2:error})
$0'
end

snippet 'should_receive' do |s|
  s.trigger = 'shr'
  s.expansion = '${1:mock}.should_receive(:${2:message})$3'
end

snippet 'with args' do |s|
  s.trigger = 'wia'
  s.expansion = 'with(${1})$2'
end

snippet 'should redirect_to' do |s|
  s.trigger = 'shrt'
  s.expansion = 'response.should redirect_to(${1:url})
$0'
end

snippet 'should render_template' do |s|
  s.trigger = 'shrt'
  s.expansion = 'response.should render_template(:${1:template})
$0'
end

snippet 'should respond_to' do |s|
  s.trigger = 'shrt'
  s.expansion = '${1:target}.should respond_to(:${2:sym})
$0'
end

snippet 'should satisfy' do |s|
  s.trigger = 'shs'
  s.expansion = '${1:target}.should satisfy { |obj| $2 }
$0'
end

snippet 'should throw' do |s|
  s.trigger = 'sht'
  s.expansion = 'lambda { $1 }.should throw_symbol(:${2:symbol})
$0'
end

snippet 'stub' do |s|
  s.trigger = 'stu'
  s.expansion = '${1:double}.stub(:${2:message})$3'
end

snippet 'after' do |s|
  s.trigger = 'aft'
  s.expansion = 'after(${1::each}) do
  $0
end'
end

snippet 'twice' do |s|
  s.trigger = 'tw'
  s.expansion = 'twice'
end
end
