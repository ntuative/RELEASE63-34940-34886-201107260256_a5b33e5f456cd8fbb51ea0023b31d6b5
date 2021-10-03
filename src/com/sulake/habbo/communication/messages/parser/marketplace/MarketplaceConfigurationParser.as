package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1544:Boolean;
      
      private var var_2445:int;
      
      private var var_1860:int;
      
      private var var_1859:int;
      
      private var var_2444:int;
      
      private var var_2441:int;
      
      private var var_2442:int;
      
      private var var_2443:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1544;
      }
      
      public function get commission() : int
      {
         return this.var_2445;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1860;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1859;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2441;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2444;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2442;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2443;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1544 = param1.readBoolean();
         this.var_2445 = param1.readInteger();
         this.var_1860 = param1.readInteger();
         this.var_1859 = param1.readInteger();
         this.var_2441 = param1.readInteger();
         this.var_2444 = param1.readInteger();
         this.var_2442 = param1.readInteger();
         this.var_2443 = param1.readInteger();
         return true;
      }
   }
}
