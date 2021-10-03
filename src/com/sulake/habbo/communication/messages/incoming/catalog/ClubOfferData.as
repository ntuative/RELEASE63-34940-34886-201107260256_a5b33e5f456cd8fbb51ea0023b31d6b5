package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1260:int;
      
      private var var_2011:String;
      
      private var var_1990:int;
      
      private var _upgrade:Boolean;
      
      private var var_2960:Boolean;
      
      private var var_2957:int;
      
      private var var_2958:int;
      
      private var var_2956:int;
      
      private var var_2955:int;
      
      private var var_2959:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1260 = param1.readInteger();
         this.var_2011 = param1.readString();
         this.var_1990 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2960 = param1.readBoolean();
         this.var_2957 = param1.readInteger();
         this.var_2958 = param1.readInteger();
         this.var_2956 = param1.readInteger();
         this.var_2955 = param1.readInteger();
         this.var_2959 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1260;
      }
      
      public function get productCode() : String
      {
         return this.var_2011;
      }
      
      public function get price() : int
      {
         return this.var_1990;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2960;
      }
      
      public function get periods() : int
      {
         return this.var_2957;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2958;
      }
      
      public function get year() : int
      {
         return this.var_2956;
      }
      
      public function get month() : int
      {
         return this.var_2955;
      }
      
      public function get day() : int
      {
         return this.var_2959;
      }
   }
}
