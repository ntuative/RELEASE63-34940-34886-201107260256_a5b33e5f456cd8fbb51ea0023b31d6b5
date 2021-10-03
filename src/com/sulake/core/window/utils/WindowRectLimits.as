package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_340:int = -2.147483648E9;
      
      private var var_337:int = 2.147483647E9;
      
      private var var_339:int = -2.147483648E9;
      
      private var var_338:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_340;
      }
      
      public function get maxWidth() : int
      {
         return this.var_337;
      }
      
      public function get minHeight() : int
      {
         return this.var_339;
      }
      
      public function get maxHeight() : int
      {
         return this.var_338;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_340 = param1;
         if(this.var_340 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_340)
         {
            this._target.width = this.var_340;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_337 = param1;
         if(this.var_337 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_337)
         {
            this._target.width = this.var_337;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_339 = param1;
         if(this.var_339 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_339)
         {
            this._target.height = this.var_339;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_338 = param1;
         if(this.var_338 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_338)
         {
            this._target.height = this.var_338;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_340 == int.MIN_VALUE && this.var_337 == int.MAX_VALUE && this.var_339 == int.MIN_VALUE && this.var_338 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_340 = int.MIN_VALUE;
         this.var_337 = int.MAX_VALUE;
         this.var_339 = int.MIN_VALUE;
         this.var_338 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_340)
            {
               this._target.width = this.var_340;
            }
            else if(this._target.width > this.var_337)
            {
               this._target.width = this.var_337;
            }
            if(this._target.height < this.var_339)
            {
               this._target.height = this.var_339;
            }
            else if(this._target.height > this.var_338)
            {
               this._target.height = this.var_338;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_340 = param1;
         this.var_337 = param2;
         this.var_339 = param3;
         this.var_338 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_340 = this.var_340;
         _loc2_.var_337 = this.var_337;
         _loc2_.var_339 = this.var_339;
         _loc2_.var_338 = this.var_338;
         return _loc2_;
      }
   }
}
