package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2311:int;
      
      private var var_2312:int;
      
      private var var_1284:int;
      
      private var var_1286:int;
      
      private var var_1997:int;
      
      private var var_2310:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2311 = param1.readInteger();
         this.var_2312 = param1.readInteger();
         this.var_1284 = param1.readInteger();
         this.var_1286 = param1.readInteger();
         this.var_1997 = param1.readInteger();
         this.var_2310 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2311;
      }
      
      public function get charges() : int
      {
         return this.var_2312;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1284;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1286;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2310;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
   }
}
