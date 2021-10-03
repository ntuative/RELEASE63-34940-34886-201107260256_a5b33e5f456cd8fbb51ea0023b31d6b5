package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_172:String = "RSPE_VOTE_QUESTION";
      
      public static const const_179:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1267:String = "";
      
      private var var_1645:Array;
      
      private var var_1326:Array;
      
      private var var_2143:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1645 = [];
         this.var_1326 = [];
         super(param1,param2,param7,param8);
         this.var_1267 = param3;
         this.var_1645 = param4;
         this.var_1326 = param5;
         if(this.var_1326 == null)
         {
            this.var_1326 = [];
         }
         this.var_2143 = param6;
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
   }
}
