package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1260:int;
      
      private var _furniId:int;
      
      private var var_2368:int;
      
      private var var_2263:String;
      
      private var var_1990:int;
      
      private var var_435:int;
      
      private var var_2366:int = -1;
      
      private var var_2367:int;
      
      private var var_1989:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1260 = param1;
         this._furniId = param2;
         this.var_2368 = param3;
         this.var_2263 = param4;
         this.var_1990 = param5;
         this.var_435 = param6;
         this.var_2366 = param7;
         this.var_2367 = param8;
         this.var_1989 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1260;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2368;
      }
      
      public function get stuffData() : String
      {
         return this.var_2263;
      }
      
      public function get price() : int
      {
         return this.var_1990;
      }
      
      public function get status() : int
      {
         return this.var_435;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2366;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2367;
      }
      
      public function get offerCount() : int
      {
         return this.var_1989;
      }
   }
}
