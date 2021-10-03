package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_614:String = "RWTDUE_TEASER_DATA";
      
      public static const const_934:String = "RWTDUE_GIFT_DATA";
      
      public static const const_774:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_239:int;
      
      private var _data:String;
      
      private var var_435:int;
      
      private var var_198:String;
      
      private var var_2336:String;
      
      private var var_2335:Boolean;
      
      private var var_1464:int = 0;
      
      private var var_3028:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_239;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_435;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2336;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2335;
      }
      
      public function get ownRealName() : String
      {
         return this.var_3028;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1464;
      }
      
      public function set status(param1:int) : void
      {
         this.var_435 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2336 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2335 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_3028 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_239 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_198;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_198 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1464 = param1;
      }
   }
}
