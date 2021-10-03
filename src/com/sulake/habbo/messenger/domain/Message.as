package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_998:int = 1;
      
      public static const const_879:int = 2;
      
      public static const const_783:int = 3;
      
      public static const const_1211:int = 4;
      
      public static const const_905:int = 5;
      
      public static const const_1235:int = 6;
       
      
      private var _type:int;
      
      private var var_1180:int;
      
      private var var_2531:String;
      
      private var var_2532:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1180 = param2;
         this.var_2531 = param3;
         this.var_2532 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2531;
      }
      
      public function get time() : String
      {
         return this.var_2532;
      }
      
      public function get senderId() : int
      {
         return this.var_1180;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
