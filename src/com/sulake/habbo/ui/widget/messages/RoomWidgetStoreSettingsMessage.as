package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1840:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_814:String = "RWSSM_STORE_SOUND";
      
      public static const const_877:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_950:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_950;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_950 = param1;
      }
   }
}
