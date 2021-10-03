package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_2026:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1478:String;
      
      private var var_2010:int;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         this.var_1478 = param2;
         this.var_2010 = param3;
      }
      
      public function get itemType() : String
      {
         return this.var_1478;
      }
      
      public function get classId() : int
      {
         return this.var_2010;
      }
   }
}
