package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class ConfirmDialog extends AlertDialog implements IConfirmDialog
   {
       
      
      public function ConfirmDialog(param1:IHabboWindowManager, param2:XML, param3:String, param4:String, param5:uint, param6:Function)
      {
         super(param1,param2,param3,param4,param5,param6);
      }
      
      override protected function dialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_615:
                  if(var_313 != null)
                  {
                     _loc3_ = WindowEvent.allocate(WindowEvent.const_153,null,null);
                     var_313(this,_loc3_);
                     _loc3_.recycle();
                  }
                  break;
               case const_1040:
               case const_1428:
                  if(var_313 != null)
                  {
                     _loc3_ = WindowEvent.allocate(WindowEvent.const_648,null,null);
                     var_313(this,_loc3_);
                     _loc3_.recycle();
                  }
            }
         }
      }
   }
}
