package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1018:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1952:String = "inventory_effects";
      
      public static const const_1201:String = "inventory_badges";
      
      public static const const_1841:String = "inventory_clothes";
      
      public static const const_1826:String = "inventory_furniture";
       
      
      private var var_2741:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_1018);
         this.var_2741 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2741;
      }
   }
}
