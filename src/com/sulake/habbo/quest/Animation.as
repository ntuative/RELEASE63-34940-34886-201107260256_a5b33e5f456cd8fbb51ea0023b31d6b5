package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   
   public class Animation implements IDisposable
   {
       
      
      private var var_98:IBitmapWrapperWindow;
      
      private var var_1133:int;
      
      private var var_1396:Boolean;
      
      private var var_217:Array;
      
      public function Animation(param1:IBitmapWrapperWindow)
      {
         this.var_217 = new Array();
         super();
         this.var_98 = param1;
         this.var_98.visible = false;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.var_98 = null;
         if(this.var_217)
         {
            for each(_loc1_ in this.var_217)
            {
               _loc1_.dispose();
            }
            this.var_217 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_98 == null;
      }
      
      public function addObject(param1:AnimationObject) : void
      {
         this.var_217.push(param1);
      }
      
      public function stop() : void
      {
         this.var_1396 = false;
         this.var_98.visible = false;
      }
      
      public function restart() : void
      {
         var _loc1_:* = null;
         this.var_1133 = 0;
         this.var_1396 = true;
         for each(_loc1_ in this.var_217)
         {
            _loc1_.onAnimationStart();
         }
         this.draw();
         this.var_98.visible = true;
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_1396)
         {
            this.var_1133 += param1;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_98.bitmap.fillRect(this.var_98.bitmap.rect,0);
         if(this.var_1396)
         {
            _loc1_ = false;
            for each(_loc2_ in this.var_217)
            {
               if(!_loc2_.isFinished(this.var_1133))
               {
                  _loc1_ = true;
                  _loc3_ = _loc2_.getBitmap(this.var_1133);
                  if(_loc3_ != null)
                  {
                     this.var_98.bitmap.copyPixels(_loc3_,_loc3_.rect,_loc2_.getPosition(this.var_1133));
                  }
               }
            }
         }
         this.var_98.invalidate(this.var_98.rectangle);
         this.var_1396 = _loc1_;
      }
   }
}
