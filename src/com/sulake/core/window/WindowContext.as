package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_664:uint = 0;
      
      public static const const_1899:uint = 1;
      
      public static const const_2206:int = 0;
      
      public static const const_2253:int = 1;
      
      public static const const_2236:int = 2;
      
      public static const const_2222:int = 3;
      
      public static const const_1922:int = 4;
      
      public static const const_448:int = 5;
      
      public static var var_430:IEventQueue;
      
      private static var var_652:IEventProcessor;
      
      private static var var_1875:uint = const_664;
      
      private static var stage:Stage;
      
      private static var var_176:IWindowRenderer;
       
      
      private var var_2529:EventProcessorState;
      
      private var var_2530:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_147:DisplayObjectContainer;
      
      protected var var_3115:Boolean = true;
      
      protected var var_1419:Error;
      
      protected var var_2268:int = -1;
      
      protected var var_1420:IInternalWindowServices;
      
      protected var var_1720:IWindowParser;
      
      protected var var_3062:IWindowFactory;
      
      protected var var_96:IDesktopWindow;
      
      protected var var_1719:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_606:Boolean = false;
      
      private var var_2528:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_176 = param2;
         this._localization = param4;
         this.var_147 = param5;
         this.var_1420 = new ServiceManager(this,param5);
         this.var_3062 = param3;
         this.var_1720 = new WindowParser(this);
         this.var_2530 = param7;
         if(!stage)
         {
            if(this.var_147 is Stage)
            {
               stage = this.var_147 as Stage;
            }
            else if(this.var_147.stage)
            {
               stage = this.var_147.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_96 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_96.limits.maxWidth = param6.width;
         this.var_96.limits.maxHeight = param6.height;
         this.var_147.addChild(this.var_96.getDisplayObject());
         this.var_147.doubleClickEnabled = true;
         this.var_147.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2529 = new EventProcessorState(var_176,this.var_96,this.var_96,null,this.var_2530);
         inputMode = const_664;
         this.var_1719 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1875;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_430)
         {
            if(var_430 is IDisposable)
            {
               IDisposable(var_430).dispose();
            }
         }
         if(var_652)
         {
            if(var_652 is IDisposable)
            {
               IDisposable(var_652).dispose();
            }
         }
         switch(value)
         {
            case const_664:
               var_430 = new MouseEventQueue(stage);
               var_652 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1899:
               var_430 = new TabletEventQueue(stage);
               var_652 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_664;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_147.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_147.removeChild(IGraphicContextHost(this.var_96).getGraphicContext(true) as DisplayObject);
            this.var_96.destroy();
            this.var_96 = null;
            this.var_1719.destroy();
            this.var_1719 = null;
            if(this.var_1420 is IDisposable)
            {
               IDisposable(this.var_1420).dispose();
            }
            this.var_1420 = null;
            this.var_1720.dispose();
            this.var_1720 = null;
            var_176 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1419;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2268;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1419 = param2;
         this.var_2268 = param1;
         if(this.var_3115)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1419 = null;
         this.var_2268 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1420;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1720;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_3062;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_96;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_96.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1922,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1719;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_96,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_96)
         {
            this.var_96 = null;
         }
         if(param1.state != WindowState.const_566)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_176.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_606 = true;
         if(this.var_1419)
         {
            throw this.var_1419;
         }
         var_652.process(this.var_2529,var_430);
         this.var_606 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2528 = true;
         var_176.update(param1);
         this.var_2528 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_96 != null && !this.var_96.disposed)
         {
            if(this.var_147 is Stage)
            {
               this.var_96.limits.maxWidth = Stage(this.var_147).stageWidth;
               this.var_96.limits.maxHeight = Stage(this.var_147).stageHeight;
               this.var_96.width = Stage(this.var_147).stageWidth;
               this.var_96.height = Stage(this.var_147).stageHeight;
            }
            else
            {
               this.var_96.limits.maxWidth = this.var_147.width;
               this.var_96.limits.maxHeight = this.var_147.height;
               this.var_96.width = this.var_147.width;
               this.var_96.height = this.var_147.height;
            }
         }
      }
   }
}
