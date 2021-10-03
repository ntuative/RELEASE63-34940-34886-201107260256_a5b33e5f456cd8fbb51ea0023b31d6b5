package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_31;
      
      private static var var_159:Stage;
      
      private static var var_336:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_836:Boolean = true;
      
      private static var var_134:DisplayObject;
      
      private static var var_1559:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_159 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_134)
            {
               var_159.removeChild(var_134);
               var_159.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_159.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_159.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_159.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_836 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_336;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_336 = param1;
         if(var_336)
         {
            if(var_134)
            {
               var_134.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_134)
         {
            var_134.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_836)
         {
            _loc1_ = var_1559[_type];
            if(_loc1_)
            {
               if(var_134)
               {
                  var_159.removeChild(var_134);
               }
               else
               {
                  var_159.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_159.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_159.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_159.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_134 = _loc1_;
               var_159.addChild(var_134);
            }
            else
            {
               if(var_134)
               {
                  var_159.removeChild(var_134);
                  var_159.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_159.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_159.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_159.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_134 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_31:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_347:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_950:
                  case MouseCursorType.const_315:
                  case MouseCursorType.const_1982:
                  case MouseCursorType.const_1981:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_836 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1559[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_134)
         {
            var_134.x = param1.stageX - 2;
            var_134.y = param1.stageY;
            if(_type == MouseCursorType.const_31)
            {
               var_336 = false;
               Mouse.show();
            }
            else
            {
               var_336 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_134 && _type != MouseCursorType.const_31)
         {
            Mouse.hide();
            var_336 = false;
         }
      }
   }
}
