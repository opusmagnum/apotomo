require 'test_helper'

class MumWidget < MouseWidget; end
class MouseTabsWidget;end

class WidgetShortcutsTest < Test::Unit::TestCase
  include Apotomo::TestCaseMethods::TestController
  
  context "#constant_for" do
    should "constantize symbols" do
      assert_equal MumWidget, constant_for(:mum)
    end
    
    should "not try to singularize the widget class" do
      assert_equal MouseTabsWidget, constant_for(:mouse_tabs)
    end
  end
  
  context "#widget" do   
    context "with all arguments" do
      setup do
        @mum = widget(:mum, 'mum', :eating, :color => 'grey', :type => :hungry)
      end
      
      should "create a MumWidget instance" do
        assert_kind_of MumWidget, @mum
        assert_equal 'mum', @mum.name
      end
      
      should "accept options" do
        assert_equal({:color => "grey", :type => :hungry}, @mum.options)
      end
    end
    
    context "with 3 arguments and no options" do
      should "not set options" do
        @mum = widget(:mum, 'mum', :squeak)
        assert_kind_of MumWidget, @mum
        assert_equal 'mum',     @mum.name
        assert_equal({},        @mum.options)
      end
    end
    
    context "with class and id" do
      setup do
        @mum = widget(:mum, 'mummy')
      end
      
      should "create a MumWidget instance" do
        assert_kind_of MumWidget, @mum
        assert_equal 'mummy', @mum.name
      end
    end
    
    context "with class, only" do
      setup do
        @mum = widget(:mum)
      end
      
      should "create a MumWidget instance named :mum" do
        assert_kind_of MumWidget, @mum
        assert_equal :mum, @mum.name
      end
    end
    
    
    should "yield itself" do
      @mum = widget(:mum, 'mum') do |mum|
        assert_kind_of MumWidget, mum
        mum << widget(:mum, 'kid')
      end
      assert_equal 2, @mum.size
      assert_kind_of MumWidget, @mum['kid']
    end
  end
end
