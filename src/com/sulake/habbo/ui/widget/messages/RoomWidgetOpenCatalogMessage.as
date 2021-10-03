package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_803:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1394:String = "RWOCM_CLUB_MAIN";
      
      public static const const_2352:String = "RWOCM_PIXELS";
      
      public static const const_2351:String = "RWOCM_CREDITS";
      
      public static const const_2276:String = "RWOCM_SHELLS";
       
      
      private var var_2568:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_803);
         this.var_2568 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2568;
      }
   }
}
