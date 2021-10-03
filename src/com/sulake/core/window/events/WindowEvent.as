package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1766:String = "WE_DESTROY";
      
      public static const const_368:String = "WE_DESTROYED";
      
      public static const const_2056:String = "WE_OPEN";
      
      public static const const_1752:String = "WE_OPENED";
      
      public static const const_1880:String = "WE_CLOSE";
      
      public static const const_1906:String = "WE_CLOSED";
      
      public static const const_1839:String = "WE_FOCUS";
      
      public static const const_344:String = "WE_FOCUSED";
      
      public static const const_1814:String = "WE_UNFOCUS";
      
      public static const const_1821:String = "WE_UNFOCUSED";
      
      public static const const_1816:String = "WE_ACTIVATE";
      
      public static const const_500:String = "WE_ACTIVATED";
      
      public static const const_1833:String = "WE_DEACTIVATE";
      
      public static const const_608:String = "WE_DEACTIVATED";
      
      public static const const_332:String = "WE_SELECT";
      
      public static const const_47:String = "WE_SELECTED";
      
      public static const const_557:String = "WE_UNSELECT";
      
      public static const const_420:String = "WE_UNSELECTED";
      
      public static const const_1860:String = "WE_LOCK";
      
      public static const const_1793:String = "WE_LOCKED";
      
      public static const const_1960:String = "WE_UNLOCK";
      
      public static const const_1901:String = "WE_UNLOCKED";
      
      public static const const_896:String = "WE_ENABLE";
      
      public static const const_268:String = "WE_ENABLED";
      
      public static const const_777:String = "WE_DISABLE";
      
      public static const const_305:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_450:String = "WE_RELOCATED";
      
      public static const const_1408:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1934:String = "WE_MINIMIZE";
      
      public static const const_1761:String = "WE_MINIMIZED";
      
      public static const const_1979:String = "WE_MAXIMIZE";
      
      public static const const_1900:String = "WE_MAXIMIZED";
      
      public static const const_1971:String = "WE_RESTORE";
      
      public static const const_1889:String = "WE_RESTORED";
      
      public static const const_666:String = "WE_CHILD_ADDED";
      
      public static const const_421:String = "WE_CHILD_REMOVED";
      
      public static const const_233:String = "WE_CHILD_RELOCATED";
      
      public static const const_167:String = "WE_CHILD_RESIZED";
      
      public static const const_375:String = "WE_CHILD_ACTIVATED";
      
      public static const const_493:String = "WE_PARENT_ADDED";
      
      public static const const_1897:String = "WE_PARENT_REMOVED";
      
      public static const const_2012:String = "WE_PARENT_RELOCATED";
      
      public static const const_531:String = "WE_PARENT_RESIZED";
      
      public static const const_1386:String = "WE_PARENT_ACTIVATED";
      
      public static const const_153:String = "WE_OK";
      
      public static const const_648:String = "WE_CANCEL";
      
      public static const const_116:String = "WE_CHANGE";
      
      public static const const_527:String = "WE_SCROLL";
      
      public static const UNKNOWN:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_763:IWindow;
      
      protected var var_1160:Boolean;
      
      protected var var_518:Boolean;
      
      protected var var_167:Boolean;
      
      protected var var_764:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_763 = param3;
         _loc5_.var_518 = param4;
         _loc5_.var_167 = false;
         _loc5_.var_764 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_763;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_518;
      }
      
      public function recycle() : void
      {
         if(this.var_167)
         {
            throw new Error("Event already recycled!");
         }
         this.var_763 = null;
         this._window = null;
         this.var_167 = true;
         this.var_1160 = false;
         this.var_764.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1160;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1160 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1160;
      }
      
      public function stopPropagation() : void
      {
         this.var_1160 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1160 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_518 + " window: " + this._window + " }";
      }
   }
}
