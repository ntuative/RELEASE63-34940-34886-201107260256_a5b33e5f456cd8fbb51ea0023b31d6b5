package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_74:String = "s";
      
      public static const const_199:String = "e";
       
      
      private var var_1588:String;
      
      private var var_2412:int;
      
      private var var_1047:String;
      
      private var var_1587:int;
      
      private var var_2036:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1588 = param1.readString();
         this.var_2412 = param1.readInteger();
         this.var_1047 = param1.readString();
         this.var_1587 = param1.readInteger();
         this.var_2036 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1588;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2412;
      }
      
      public function get extraParam() : String
      {
         return this.var_1047;
      }
      
      public function get productCount() : int
      {
         return this.var_1587;
      }
      
      public function get expiration() : int
      {
         return this.var_2036;
      }
   }
}
