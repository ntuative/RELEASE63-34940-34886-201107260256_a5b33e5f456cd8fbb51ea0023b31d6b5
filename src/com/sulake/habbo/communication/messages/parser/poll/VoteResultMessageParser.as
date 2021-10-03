package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1267:String;
      
      private var var_1645:Array;
      
      private var var_1326:Array;
      
      private var var_2143:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1267;
      }
      
      public function get choices() : Array
      {
         return this.var_1645.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1326.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2143;
      }
      
      public function flush() : Boolean
      {
         this.var_1267 = "";
         this.var_1645 = [];
         this.var_1326 = [];
         this.var_2143 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1267 = param1.readString();
         this.var_1645 = [];
         this.var_1326 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1645.push(param1.readString());
            this.var_1326.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2143 = param1.readInteger();
         return true;
      }
   }
}
