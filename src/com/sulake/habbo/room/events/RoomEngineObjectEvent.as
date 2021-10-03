package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_758:String = "REOE_OBJECT_SELECTED";
      
      public static const const_520:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_186:String = "REOB_OBJECT_ADDED";
      
      public static const const_397:String = "REOE_OBJECT_REMOVED";
      
      public static const const_161:String = "REOB_OBJECT_PLACED";
      
      public static const const_1010:String = "REOB_OBJECT_CONTENT_UPDATED";
      
      public static const const_742:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_188:String = "REOB_OBJECT_MOUSE_ENTER";
      
      public static const const_196:String = "REOB_OBJECT_MOUSE_LEAVE";
      
      public static const const_143:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_165:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_162:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_146:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const const_168:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_145:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_173:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_117:String = "REOR_REMOVE_DIMMER";
      
      public static const const_151:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_163:String = "REOR_WIDGET_REQUEST_PLAYLIST_EDITOR";
      
      public static const const_536:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_505:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_503:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_543:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_239:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_239 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_239;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
