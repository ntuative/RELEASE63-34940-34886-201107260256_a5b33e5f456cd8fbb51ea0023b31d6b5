package com.sulake.habbo.session.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class BadgeImageReadyEvent extends Event
   {
      
      public static const const_228:String = "BIRE_BADGE_IMAGE_READY";
       
      
      private var var_1943:String;
      
      private var var_48:BitmapData;
      
      public function BadgeImageReadyEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_228,param3,param4);
         this.var_1943 = param1;
         this.var_48 = param2;
      }
      
      public function get badgeId() : String
      {
         return this.var_1943;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_48;
      }
   }
}
